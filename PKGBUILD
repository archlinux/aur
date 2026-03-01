# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=e-tho
_pkgname=bzmenu
pkgname=${_pkgname}-bin
pkgdesc="Launcher-driven Bluetooth manager for Linux"

pkgver=0.4.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-linux-gnu' 'aarch64-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('438e7a3d4db4f297e59d196e0e10e3c70eb87d4004ea27a56c46d172dcee30d5'
            '5735febb4249f2fea35481266e47668eb890404f83714ec3d12f68e80c95d72f')
sha256sums_x86_64=('4285e3fb7bbbfdaafd1ca0ef62a47ca4999ca8ade05665a20edac0289a55f63d')
sha256sums_aarch64=('4ab471f21dbec21e853a74dda428c5574894cbe7426474ef3218b0a22e535fb3')


package() {
	cd "${srcdir}" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
