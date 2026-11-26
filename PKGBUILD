# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=thunderid-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Open-source identity and access management for humans, AI agents and machines"
arch=('x86_64' 'aarch64')
url="https://github.com/thunder-id/thunderid"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/thunder-id/thunderid/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/thunderid-${pkgver}-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/thunderid-${pkgver}-linux-arm64.zip")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('27a70400241f14e51b738bc88ef32a6d652619f069a2ce1efdac15cc3b1cd906')
sha256sums_aarch64=('3e68a0350f570dabb80ff6894c78d8a758d2047378046c032872f54630d35abf')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="thunderid-${pkgver}-linux-x64" ;;
    aarch64) _dir="thunderid-${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/thunderid" "${pkgdir}/usr/bin/thunderid"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
