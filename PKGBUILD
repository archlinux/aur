# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=simplenote-electron-bin
pkgver=1.18.0
pkgrel=1
pkgdesc="The simplest way to keep notes"
arch=('x86_64')
url="https://github.com/Automattic/simplenote-electron"
license=('GPL2')
depends=('nss' 'gtk3' 'libxss')
provides=('simplenote')
source=("${url}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-amd64.deb")
sha256sums=('daa9d5d53c271ddc2fda921a0b9e1fa92794c8677595f191cc8387eacaac43d3')
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
