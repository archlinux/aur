# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Owloops
_pkgname=updo
pkgname=${_pkgname}-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Uptime monitoring CLI tool with alerting and advanced settings"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")

sha256sums_x86_64=('9ae8b132440d1bee379a4a2f37a69e55fedb0a86b8eb8a6df25d11a6f5394c41')
sha256sums_i686=('0290ad4556c2ae4695ae0570f7900589a360d5a0376f83cbf62199af78f6fa66')
sha256sums_aarch64=('5d8787bb21bb97a2caecc683678bf29d312f4f05e4559bfb375207f8867e7258')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
