# Maintainer: Heiko Nickerl <dev at heiko-nickerl dot com>
pkgname="sodalite"
pkgver="0.19.5"
pkgrel=1
pkgdesc="Keyboard-driven terminal file navigator and launcher"
arch=('any')
url="https://www.github.com/hnicke/sodalite"
license=('GPL')
makedepends=('git' 'awk' )
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
sha256sums=(a2a3eebf2d79705ac28e5e70f5a63aff0dab047d18cf69bc9fcf4bbd4095ea53)




_gitroot=https://github.com/hnicke/$pkgname.git

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    make sysconfdir=/etc prefix=/usr DESTDIR="$pkgdir" install
}
