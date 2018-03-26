# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=elastix
pkgname=${_pkgname}-bin
pkgver=4.9.0
pkgrel=1
pkgdesc='Toolbox for rigid and nonrigid registration of images'
arch=('x86_64')
url='http://elastix.isi.uu.nl/'
license=('apache')
provides=('elastix')
depends=()
makedepends=()
optdepends=()
conflicts=('elastix-git' 'elastix')
source=("https://github.com/SuperElastix/elastix/releases/download/${pkgver}/elastix-${pkgver}-linux.tar.bz2")
sha512sums=('9523e0ad5a949c6cd99a76c1877e9c9db7ddf0d2801ce6fd8d80fadfb922bf250b743e45656fac3095d760ca9da51c0214a9eb2b52af689a1eb28d1971402b43')

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

