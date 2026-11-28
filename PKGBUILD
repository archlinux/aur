# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lerd-bin
pkgver=1.39.3
pkgrel=1
pkgdesc="Local PHP development environment"
arch=('x86_64' 'aarch64')
url="https://github.com/lerd-env/lerd"
license=('MIT')
depends=('glib2' 'glibc' 'gtk3' 'libayatana-appindicator')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/lerd_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/lerd_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('ff2f12e67e712930d774eca62ca960a5f509b1e49da10493170fcce279436ca9')
sha256sums_aarch64=('907bb1f052d47438638126b06cf06563c85632c05b7f2eab2deb79f587b027b7')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="." ;;
    aarch64) _dir="." ;;
  esac
  install -Dm755 "${_dir}/lerd" "${pkgdir}/usr/bin/lerd"
  install -Dm755 "${_dir}/lerd-tray" "${pkgdir}/usr/bin/lerd-tray"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
