# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=yorkie-bin
pkgver=0.7.29
pkgrel=1
pkgdesc="Document store for collaborative applications"
arch=('x86_64' 'aarch64')
url="https://github.com/yorkie-team/yorkie"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/yorkie-team/yorkie/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/yorkie-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/yorkie-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('e5120534d977062c43957247aa72b4e8ef8ed5d0fbc33b4fafea190b8e68c65b')
sha256sums_aarch64=('cfe54bfd6160b088993af2d01238159912de558b8a653dd85a67e10ade680e2c')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="yorkie-v${pkgver}-linux-amd64" ;;
    aarch64) _dir="yorkie-v${pkgver}-linux-arm64" ;;
  esac
  install -Dm755 "${_dir}/yorkie" "${pkgdir}/usr/bin/yorkie"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
