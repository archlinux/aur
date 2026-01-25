# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com/wader/ansisvg/releases/download/v0.3.0/ansisvg_0.3.0_linux_amd64.tar.gz
_pkgauthor=wader
_pkgname=ansisvg
pkgname=${_pkgname}-bin
pkgdesc="Convert ANSI to SVG"

pkgver=0.4.0
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
            '24d933035fa5d768174d3a86ff79873c35d893c4aa1998f3d3df3e9e89cb334f')
sha256sums_x86_64=('7ae9e5cc2d39d72661fba547716d0aa2c2eb3ccb3ceeb86ead6125dbb7f287f4')
sha256sums_aarch64=('0e0c5faf241213d243499e0782de32fd3e3f512a6799c7faa478bc6bb5aa084c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
