# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>

pkgname=maildir-utils
pkgver=1.6.1
pkgrel=1
pkgdesc="maildir indexer/searcher + emacs mail client + guile bindings"
arch=('i686' 'x86_64')
url="https://www.djcbsoftware.nl/code/mu/"
license=('GPL')
depends=('xapian-core' 'gmime3' 'gtk3' 'webkit2gtk' 'guile')
source=(https://github.com/djcb/mu/releases/download/${pkgver}/mu-${pkgver}.tar.xz)
sha512sums=('d894f302cabef86ff6b1d85eb945b2aca27729eaa6558598076c8f065d584592d5e601fe6a6045cea9b8a1466320c838f995ffdfd564447683538a5e48f8d7b0')

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

