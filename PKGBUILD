# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=paxm-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="Persistent, provider-neutral memory for AI coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/pax-beehive/paxm"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/pax-beehive/paxm/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/paxm_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/paxm_v${pkgver}_linux_arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('e3f23faf7c2bfbe6159a3880dcbedaaaf8e510cde84c288e4e141c78b99cc5f7')
sha256sums_aarch64=('48f74f32daf6c95793f1c74ba4069782c92dc23e1c546cbfc5b31449fa4725db')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="paxm_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="paxm_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/paxm" "${pkgdir}/usr/bin/paxm"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
