# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>

pkgname=maildir-utils
pkgver=1.6.2
pkgrel=1
pkgdesc="maildir indexer/searcher + emacs mail client + guile bindings"
arch=('i686' 'x86_64')
url="https://www.djcbsoftware.nl/code/mu/"
license=('GPL')
depends=('xapian-core' 'gmime3' 'gtk3' 'webkit2gtk' 'guile')
source=(https://github.com/djcb/mu/releases/download/${pkgver}/mu-${pkgver}.tar.xz)
sha512sums=('5db0d775520687224649d24c956f9ed7e36ebb534f6fc6f4caf5223cc2cdb3855cc0d122369f37fcf919ebacb58a94b0cb681448c08af01eebef3b81074241d4')

prepare() {
	mv "$srcdir/mu-${pkgver}" "$srcdir/${pkgname}-${pkgver}"
}

build() {
        cd "$srcdir/$pkgname-$pkgver"
        ./configure --prefix=/usr
        make
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" install
}

