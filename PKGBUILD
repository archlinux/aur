# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mindfs-bin
pkgver=0.5.9
pkgrel=1
pkgdesc="Access your personal AI agents and workstation data anywhere, anytime through MindFS"
arch=('x86_64' 'aarch64')
url="https://github.com/a9gent/mindfs"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/a9gent/mindfs/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mindfs_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/mindfs_v${pkgver}_linux_arm64.tar.gz")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('07c64582dc9e3a188640ce11950008a4b999d423a8b062b5884eb6df1c4ff6c0')
sha256sums_aarch64=('e193a82dac6df82987588a8cb6771d4d254ce62b3854d8b90cb63fb19d10cf4e')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="mindfs_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="mindfs_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/mindfs" "${pkgdir}/usr/bin/mindfs"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
