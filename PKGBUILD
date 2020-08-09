# Maintainer: Benjamin Feakins <feakster at posteo dot eu>
# Modified PKGBUILD from https://aur.archlinux.org/packages/simplenote-electron-bin/

pkgname=simplenote-electron-bin-arm
pkgver=1.20.0
pkgrel=1
pkgdesc="The simplest way to keep notes"
arch=('armv7h' 'aarch64')
url="https://github.com/Automattic/simplenote-electron"
license=('GPL2')
depends=('nss' 'gtk3' 'libxss')
provides=('simplenote')
source_armv7h=("${url}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-armv7l.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-arm64.deb")
sha256sums_armv7h=('899016470eabbdf8dd404f5eefe282fa857debf3475a73a39c7cd7400db3a84c')
sha256sums_aarch64=('1e69a80a386ea70df0d8084df70da2052c03fead5e49523bfe82aa88bcf476d0')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/Simplenote/${pkgname%-electron-bin}" "${pkgdir}/usr/bin"
}
