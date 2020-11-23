# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>

pkgname=maildir-utils
pkgver=1.4.13
pkgrel=1
pkgdesc="maildir indexer/searcher + emacs mail client + guile bindings"
arch=('i686' 'x86_64')
url="https://www.djcbsoftware.nl/code/mu/"
license=('GPL')
depends=('xapian-core' 'gmime3' 'gtk3' 'webkit2gtk' 'guile')
source=(https://github.com/djcb/mu/releases/download/${pkgver}/mu-${pkgver}.tar.xz)
sha512sums=('f84fc0798f25b9f73c18581edf19f789910734c996ac0665b79703fab230b1caf039adf2bdc825fe90f87351d3c2877ff39028224e5222454b9828ff8533aef8')

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

