# Maintainer: Heiko Nickerl <dev at heiko-nickerl dot com>
pkgname="sodalite"
pkgver=0.14.6
pkgrel=1
pkgdesc="Keyboard-driven terminal file navigator and launcher"
arch=('any')
url="www.github.com/hnicke/sodalite"
license=('GPL')
makedepends=('git' 'awk' )
depends=('python-binaryornot' 'python-urwid' 'python-yaml' 
'python-pyperclip' 'python-pygments' 'python-watchdog')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hnicke/sodalite/archive/v$pkgver.tar.gz")
backup=('etc/sodalite.conf')
sha256sums=('35109b8e028be492409344443b7057565e08cf9de3b501f8bccbb0c78fd5b223')
install=sodalite.install

_gitroot=https://github.com/hnicke/$pkgname.git

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    make sysconfdir=/etc prefix=/usr DESTDIR="$pkgdir" install
}
