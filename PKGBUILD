# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hedhyw
_pkgname=json-log-viewer
_pkgexec=jlv
pkgname=${_pkgname}-bin
pkgver=1.4.0
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
sha256sums_x86_64=('207d2b2a65b96f82fbe1161df2e620d538c892c10e4683f1599696aa9570a9e8')
sha256sums_i686=('9443c81e344e15f489bb1e6623050fcba9d8e534f4fe897e42ef36614eff5b53')
sha256sums_aarch64=('1d856d9c037b07a528396a4756adcce3b86dcd344fb0a8f36eb7828f8ad7fab2')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
