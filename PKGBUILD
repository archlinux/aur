# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_pkgname=pangoterm
pkgname=$_pkgname-bzr
pkgver=r626
pkgrel=1
pkgdesc='A GTK/Pango-based terminal that uses libvterm to provide terminal emulation.'
arch=('x86_64')
url='https://www.leonerd.org.uk/code/pangoterm'
license=('MIT')
depends=('libvterm' 'gtk2')
makedepends=('bzr' 'libvterm' 'gtk2')
provides=($_pkgname)
conflicts=($_pkgname)
install=pangoterm.install
source=('bzr+https://launchpad.net/pangoterm' 'pangoterm.install')
sha256sums=('SKIP'
            'b8e0a46ff41aa4b51ce1d1875fba4410181ff4c1ef436cc02b5108da3446f23b')

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
