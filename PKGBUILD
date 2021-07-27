# Maintainer: Heiko Nickerl <dev at heiko-nickerl dot com>
pkgname=sodalite
pkgver=0.19.8
pkgrel=1
pkgdesc="Keyboard-driven terminal file navigator and launcher"
arch=('any')
url="https://www.github.com/hnicke/sodalite"
license=('GPL')
makedepends=('git' 'awk')
depends=(
    'python>=3.9'
    'python-binaryornot'
    'python-urwid'
    'python-yaml'
    'python-pyperclip'
    'python-pygments'
    'python-watchdog'
    'python-click'
    'python-blinker'
    'xdg-utils'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/hnicke/sodalite/archive/v$pkgver.tar.gz")
backup=('etc/sodalite.conf')
sha256sums=('e72bc1fe8c134aa67ae776d901e8c98081e2e7097bfb9dcf06f4266dd7e072de')

_gitroot=https://github.com/hnicke/$pkgname.git

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    make sysconfdir=/etc prefix=/usr DESTDIR="$pkgdir" install
}
