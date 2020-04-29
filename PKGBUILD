# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=libndi-bin
_pkgname=obs-ndi
pkgver=4.5.1
_pkgver=4.9.0
pkgrel=5
_pkgrel=1
pkgdesc="Custom build of ndi-sdk from obs-ndi"
arch=('x86_64')
license=('LGPL2.0')
url="https://github.com/Palakis/${_pkgname}"
provides=('libndi')
conflicts=('libndi-git' 'ndi-sdk')
source=("${url}/releases/download/${_pkgver}/libndi4_${pkgver}-${_pkgrel}_amd64.deb")
sha256sums=('2c65ca3e2bf7d3a03cd730cb111da4396b9512da5b9417bb01d8b6b092245573')

package() {
	cd "${srcdir}"

	tar -xJf data.tar.xz -C "${pkgdir}"
	rm "${pkgdir}"/usr/lib/libndi.so.4
}
