# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

# https://github.com/wader/ansisvg/releases/download/v0.3.0/ansisvg_0.3.0_linux_amd64.tar.gz
_pkgauthor=wader
_pkgname=ansisvg
pkgname=${_pkgname}-bin
pkgdesc="Convert ANSI to SVG"

pkgver=0.5.0
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
            'f42251a28e282ba0516e3ee9659df6cb94aa8fd32fbcdd714ccea7f81e611ba7')
sha256sums_x86_64=('79eac5bad918ad9e4acec3baafdfa613176578f73411167dfdbab17d50b00ad6')
sha256sums_aarch64=('08af1981da8a3ed3b1c1afa1afd18c2a7cbf9de329ef74861db0c7704db9974c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
