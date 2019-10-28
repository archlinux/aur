# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=elastix
pkgname=${_pkgname}-bin
pkgver=5.0.0
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
sha256sums=('7c6bdc7667aaf736b1f5bd70ad496288f737106fd1cb22c019f0bae0363d8b5c')

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

