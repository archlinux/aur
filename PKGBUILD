# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Pranay Kanwar <warl0ck@metaeye.org>
pkgname=stan
pkgver=0.4.1
pkgrel=2
pkgdesc="Stream analyzer intended for reverse engineering and cryptographic analysis."
arch=('i686' 'x86_64')
url="http://www.roqe.org/stan"
license='custom'
depends=('glibc')
changelog=Changelog
source=("https://web.archive.org/web/20130507102710/http://www.roqe.org/stan/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b010ffa03d9ad8e8d7cf2cfc2692faec67f6e177ac54b432b2e2bff50b258f5b')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install

	# license
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# readme
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

