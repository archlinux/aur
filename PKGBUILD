# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_pkgname=pangoterm
pkgname=$_pkgname-bzr
pkgver=r626
pkgrel=4
pkgdesc='A GTK/Pango-based terminal that uses libvterm to provide terminal emulation.'
arch=('x86_64')
url='https://www.leonerd.org.uk/code/pangoterm'
license=('MIT')
depends=('libvterm' 'gtk2')
makedepends=('bzr' 'python-dulwich')
provides=($_pkgname)
conflicts=($_pkgname)
install=pangoterm.install
source=('bzr+https://launchpad.net/pangoterm' 'pangoterm.install')
sha256sums=('SKIP'
            'd51e7b8fbf5ecd9766bb4ea997971be240342bd1eb50fa1505da2ffdeedd6645')

build() {
    cd $_pkgname
    make PREFIX=/usr
}

package() {
    cd $_pkgname
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 pangoterm.cfg "$pkgdir/usr/share/$_pkgname/pangoterm.cfg"
}
