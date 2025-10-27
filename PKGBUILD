# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hedhyw
_pkgname=json-log-viewer
_pkgexec=jlv
pkgname=${_pkgname}-bin
pkgver=1.5.1
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
sha256sums_x86_64=('9cb57d61162e6dd58a8bff37af19a5027d47b9474d59179dd14007bbd57ca171')
sha256sums_i686=('6a571f1529ca063a164632931ef806492223b88a12b32c4c346d411d4e7f7434')
sha256sums_aarch64=('9cb50b2c5f3fd0f370f1a6bf2941efa78fda7f49814ef090ecbd43b8a5513f41')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
