# Maintainer: Heiko Nickerl <dev at heiko-nickerl dot com>
pkgname="sodalite"
pkgver=0.15.1
pkgrel=2
pkgdesc="Keyboard-driven terminal file navigator and launcher"
arch=('any')
url="www.github.com/hnicke/sodalite"
license=('GPL')
makedepends=('git' 'awk' )
depends=('python-binaryornot' 'python-urwid' 'python-yaml' 
'python-pyperclip' 'python-pygments' 'python-watchdog')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hnicke/sodalite/archive/v$pkgver.tar.gz")
backup=('etc/sodalite.conf')
sha256sums=('695bf4a89098e552b138a79f0dbce9db31c39bfbac1d700d949a60a35d3dc924')

_gitroot=https://github.com/hnicke/$pkgname.git

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    make sysconfdir=/etc prefix=/usr DESTDIR="$pkgdir" install
}
