# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hedhyw
_pkgname=json-log-viewer
_pkgexec=jlv
pkgname=${_pkgname}-bin
pkgver=1.3.0
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
sha256sums_x86_64=('77de376fe5895d56e2246925ae429cee1c675d99aa3525d1182dd8e2d0b81e0d')
sha256sums_i686=('acaa727c4d6ea1cf02b4da031a9f8b9fa8599f0c742722ec56402a62d6b57eac')
sha256sums_aarch64=('c51ec83bc6811fa106d80c943fccc6aa6cf4fb8a146ff96f57e98ba90f241fad')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
