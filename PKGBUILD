# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com/wader/ansisvg/releases/download/v0.3.0/ansisvg_0.3.0_linux_amd64.tar.gz
_pkgauthor=wader
_pkgname=ansisvg
pkgname=${_pkgname}-bin
pkgdesc="Convert ANSI to SVG"

pkgver=0.3.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_linux_${_barch[1]}.tar.gz")
sha256sums=('265974823e3438d015acbbb43c0f745530bd20f50b2b7cb97f5397e1027fc2cc'
            '68fa81485ae1d32f130f3582860e39fbb209648750e0d134206047bd719f8e73')
sha256sums_x86_64=('c670710a706623f2712eeec3564b6e2a7ac95d33cdc4f38a877460118e7da9d4')
sha256sums_aarch64=('a4136bc6f05b178fd2c2c4398f9b0497795ffe3b1e5a91c5fdc3da4b775c7a7c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
