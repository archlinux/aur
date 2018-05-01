# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=simplenote-electron-bin
_pkgname=simplenote
pkgver=1.1.3
pkgrel=3
pkgdesc="The simplest way to keep notes"
arch=('x86_64')
url="https://github.com/Automattic/simplenote-electron"
license=('GPL2')
depends=('gcc-libs' 'gconf' 'alsa-lib' 'nss' 'libxtst' 'gtk2')
provides=('simplenote')
source=("https://github.com/Automattic/simplenote-electron/releases/download/v${pkgver}/Simplenote-linux-${pkgver}.deb")
sha256sums=('7ea24983e0a8738a628db9aeccca50b21b098c7725aaf8643416c90ea5e76758')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"

  mkdir -p ${pkgdir}/usr/bin/
  ln -s /opt/Simplenote/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
