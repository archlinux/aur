# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>

pkgname=maildir-utils
pkgver=1.6.0
pkgrel=1
pkgdesc="maildir indexer/searcher + emacs mail client + guile bindings"
arch=('i686' 'x86_64')
url="https://www.djcbsoftware.nl/code/mu/"
license=('GPL')
depends=('xapian-core' 'gmime3' 'gtk3' 'webkit2gtk' 'guile')
source=(https://github.com/djcb/mu/releases/download/${pkgver}/mu-${pkgver}.tar.xz)
sha512sums=('d0501a7cffe4649f4206b1fc67805f73eb62944dd96cb58e8e1a982c947be3f541ff7f588527ee6fd1c82258d0eedd6d8a75d723e3c8a18d2fa454dd6a1263a5')

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

