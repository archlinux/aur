# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: MidAutumnMoon <mid.autumn0moon@gmail.com>

_pkgauthor=ameshkov
_pkgname=dnslookup
pkgname=${_pkgname}-bin
pkgver=1.12.0
pkgrel=1
pkgdesc='Simple command line utility to make DNS lookups to the specified server'

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

arch=('x86_64' 'i686' 'aarch64')
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-v${pkgver}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-386-v${pkgver}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64-v${pkgver}.tar.gz")
sha256sums_x86_64=('bedcf2a10777cd51d1b07a470e8573c4468497ef765d894bef445e0af61d2f07')
sha256sums_i686=('ff3db08e04bd60d5c941ada2e96ccb97d5a3233bb7d3afb8b73a59ac1dbf0c87')
sha256sums_aarch64=('bba37c4a370d7d21234f430559e4987bc45f0a178d4b8b7c6b1809f763250702')


package() {
  cd "${srcdir}/linux-"* || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
