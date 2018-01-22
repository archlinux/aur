# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=elastix
pkgname=${_pkgname}-bin
pkgver=4.8
pkgrel=1
pkgdesc='Toolbox for rigid and nonrigid registration of images'
arch=('x86_64')
url='http://elastix.isi.uu.nl/'
license=('apache')
provides=('elastix')
depends=()
makedepends=()
optdepends=()
conflicts=('elastix-git')
source=('http://elastix.isi.uu.nl/download/elastix_linux64_v4.8.tar.bz2')
sha512sums=('63d53cf5b9aad85046ef983948e5624c0b1e6b40b07e76b1388299a55ad634d970234fa2142518b7b70db425f5d58d622f532c58a4edc975ae31a1c383d5ca8f')

package() {
	cd "${srcdir}"

	mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}"

	cp -r bin "${pkgdir}/usr/bin"
	cp -r lib "${pkgdir}/usr/lib"

	install -D -m644 \
		"LICENSE" \
		"$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

	install -D -m644 \
		"NOTICE" \
		"$pkgdir/usr/share/licenses/$_pkgname/NOTICE"
}

