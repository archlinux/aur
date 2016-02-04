pkgname=blogc-runserver
pkgver=0.1
pkgrel=1
pkgdesc="A simple HTTP server to test blogc websites"
arch=('i686' 'x86_64')
url="https://github.com/blogc/blogc-runserver"
license=('BSD')
depends=('libevent')
source=("https://github.com/blogc/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('b88306f89087fdbd6af7f7590026b94b5cb5b065bbe4d8ea424545c127c5eb69')


build() {
	cd  "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr/
	make
}

package() {
	cd  "${srcdir}/${pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

