# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jmelahman
_pkgname=work
pkgname=${_pkgname}-bin
pkgver=1.0.12
pkgrel=1
pkgdesc='A stupid simple time tracker'

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('9815f85f34f804e3d425d09b8e4c2fb9e59955d0fe3b53021cfcce4cdf9e9789')
sha256sums_aarch64=('d26687bb96803a72a67c7af04b252937c553a2f68aa33176ba3643a3c0cdae08')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
