# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=simplenote-electron-bin
pkgver=1.21.0
pkgrel=1
pkgdesc="The simplest way to keep notes"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/Automattic/simplenote-electron"
license=('GPL2')
depends=('nss' 'gtk3' 'libxss')
provides=('simplenote')
source_x86_64=("${url}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-amd64.deb")
source_armv7h=("${url}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-armv7l.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-arm64.deb")
sha256sums_x86_64=('4186484985bd691fb5ae771fb98880b36fb2e505efa838f4d3353efc14796d1c')
sha256sums_armv7h=('a6214a2a87d4ad2a2a9263b5ec9b1eae7e37b7ee3a18f305af3fe98e7b6943bf')
sha256sums_aarch64=('717508a6b78038921b18a7a976107f08fe19124e9bf86577105d5a505bf85c9e')

# Warning: the release deb file has been known to be silently modified,
# resulting in a different checksum. If the checksum fails to validate, this is
# most likely the cause. If you are concerned about the security implications of this,
# do not install this package. The web app at https://app.simplenote.com/ may better suit.
#
# This issue has been raised and acknowledged by Automattic on github: https://github.com/Automattic/simplenote-electron/issues/759
# See also related conversation on the aur: https://aur.archlinux.org/packages/simplenote-electron-bin/

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/Simplenote/${pkgname%-electron-bin}" "${pkgdir}/usr/bin"
}
