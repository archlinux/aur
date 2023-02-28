# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-avahi
pkgver=0.4.1
pkgrel=1
pkgdesc='Avahi bindings for GNU Guile'
arch=('x86_64' 'i686' 'armv7h')
url='https://www.nongnu.org/guile-avahi'
license=('LGPL3')
depends=('guile' 'avahi' 'gmp')
source=("https://download.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('db9de9e19df728b40d23c0381caa9f8eda2b175fa7f69f153be8f3f078044ca5')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr \
		--with-guilemoduledir=/usr/share/guile/site/3.0 \
		--disable-rpath
	make
}

check(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
