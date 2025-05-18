# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=szktkfm
_pkgname=mdtt
pkgname=${_pkgname}-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Markdown Table Editor TUI'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_i686=("${_pkgname}-${pkgver}-${arch[1]}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-${arch[2]}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('6e82dd06ebbcf6ed7e322ece4fb48385bb3b696b80d9df9e08b87395efda1a75')
sha256sums_i686=('bf91c5054bed614704e3bac647a17ad1e9dfd5f41875255163cb70a4508aeb52')
sha256sums_aarch64=('7b0ed86a1646e0c2e52df89be65949353a6fc84d75175ce678f078032269aaeb')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
