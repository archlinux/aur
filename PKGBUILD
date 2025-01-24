# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hedhyw
_pkgname=json-log-viewer
_pkgexec=jlv
pkgname=${_pkgname}-bin
pkgver=1.2.2
pkgrel=1
pkgdesc='Interactive viewer for JSON logs.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgexec}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgexec}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgexec}_linux_386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgexec}_linux_arm64.tar.gz")
sha256sums_x86_64=('add4d9cd829686cf01ad854d736a2550b291d1618390c51f81b152133ecf984a')
sha256sums_i686=('8df8526dff5a9588a2ddb7b59771322f5d1134345f307469a40ddc0dfbeeae05')
sha256sums_aarch64=('a7483988aaf4eca759a70ef5ee5f06032da2238915a8a2c1e9b203c250f78d37')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
