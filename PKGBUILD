# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>

pkgname=maildir-utils
pkgver=1.4.15
pkgrel=1
pkgdesc="maildir indexer/searcher + emacs mail client + guile bindings"
arch=('i686' 'x86_64')
url="https://www.djcbsoftware.nl/code/mu/"
license=('GPL')
depends=('xapian-core' 'gmime3' 'gtk3' 'webkit2gtk' 'guile')
source=(https://github.com/djcb/mu/releases/download/${pkgver}/mu-${pkgver}.tar.xz)
sha512sums=('e7741b77bce5c7c1c818549e803fb386f0b8727b995a7ac9b961b74e89cc7dbeed52b45d70895995a1640cfd36a49b052eeeed9be6c48999f2182a68bf5c205e')

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

