# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ChausseBenjamin
_pkgname=termpicker
pkgname=${_pkgname}-bin
pkgver=1.4.0
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

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_${_barch[0]}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_${_barch[1]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_${_barch[2]}.tar.gz")

sha256sums=('bf9abdea4e804279ff552c3d4f25d3dc82463760f999bf2b26960f8788debad8'
            '6b1afa4aaa6bcab0229dd31b8fc0d08b9962453200d02ed3bde2302b11a5d411')
sha256sums_x86_64=('090f08e1425a1759f26a83b38009352aec90c16e79b003b4c2444ce446c68a2d')
sha256sums_i686=('fb3d059282b09a29a7d95ad6501c2ac9b826c8bd1147c95ea7a581fa52b94bce')
sha256sums_aarch64=('366c558410969e08226b02ed5b4a87fb38327fb9f5f19b9ee5921d613cfaf439')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
