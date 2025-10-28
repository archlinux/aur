# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ChausseBenjamin
_pkgname=termpicker
pkgname=${_pkgname}-bin
pkgver=1.5.1
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
            '6b1afa4aaa6bcab0229dd31b8fc0d08b9962453200d02ed3bde2302b11a5d411')
sha256sums_x86_64=('1ee66612d610f3b7992e1a37f02f3e9be8454c7d13bcabe30d870e5655d11438')
sha256sums_i686=('0ff380eb59fc2e09832e57792da64dd5ef20231179e820ed7b940ed0d541ad3d')
sha256sums_aarch64=('d2cfbfca3846a40d72ddd89b5c74334f03bfb112c45a5970698bea0970e53e1d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
