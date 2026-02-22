# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Microwave Tank <microwave@particlecannon.org>

_pkgauthor=pressly
_pkgname=goose
pkgname=${_pkgname}-bin
pkgdesc="A database migration tool. Supports SQL migrations and Go functions."

pkgver=3.27.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_x86_64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[1]}")
sha256sums=('c176aa89390dac99947682abdd6d3772ecb996910c2099dde986c0d5a98bc800'
            'f23985556a879c0e68bb4e136ee4b88a550d26fa33db77a65d76b721c93093ef')
sha256sums_x86_64=('ad487c23744ae5de5dbdf5a81d4e6fac05fdfbe74f02379f9e498cf2070a9ef8')
sha256sums_aarch64=('55f65caa1ee94d4b66f1bdf7091df3bdf72578cf8d44a817b2d6cd6f96af8b02')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
