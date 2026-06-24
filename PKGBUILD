# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ChausseBenjamin
_pkgname=termpicker
pkgname=${_pkgname}-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="A color picker for the terminal"
arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i386' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('Beerware')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=(
  'wl-clipboard: clipboard support on wayland'
  'xsel: clipboard support on X11'
)

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_${_barch[0]}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_${_barch[1]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_${_barch[2]}.tar.gz")

sha256sums=('bf9abdea4e804279ff552c3d4f25d3dc82463760f999bf2b26960f8788debad8'
            'b8b17b558d3bcfd8c77d9044bcfc5ca60d606440b504e83592213c311b0d5051')
sha256sums_x86_64=('5538925cc09a0ecb9862d9e490c8ad2ba12487f057988ba5056251c82f76b6da')
sha256sums_i686=('3cc531b28109e438b793988c6c0d99e5a55382c82b434088224207993d5fa613')
sha256sums_aarch64=('b2019ca54825e7408c2c1070aed649f00dc6471b9544ecf4793fed06391cea8c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
