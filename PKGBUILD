# Maintainer: Heiko Nickerl <dev at heiko-nickerl dot com>
pkgname="sodalite"
pkgver=0.15.0
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
sha256sums=('616385c3795ad95f36191c5ef97c0bc1e1c10c446306a778533231a166c772a1')
install=sodalite.install

_gitroot=https://github.com/hnicke/$pkgname.git

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    make sysconfdir=/etc prefix=/usr DESTDIR="$pkgdir" install
}
