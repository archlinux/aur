# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jmelahman
_pkgname=work
pkgname=${_pkgname}-bin
pkgver=1.0.12
pkgrel=1
pkgdesc='A stupid simple time tracker.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
sha256sums_x86_64=('9815f85f34f804e3d425d09b8e4c2fb9e59955d0fe3b53021cfcce4cdf9e9789')
sha256sums_i686=('d26687bb96803a72a67c7af04b252937c553a2f68aa33176ba3643a3c0cdae08')
sha256sums_aarch64=('94b3ac7a86fad6be9e66b61b6a5b12a95c4244e9b25be94f3a505ac42b38edf1')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
