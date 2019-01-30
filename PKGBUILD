# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>
# Maintainer: Kewl <kewl@alto.eu.org>

pkgname=simplenote-electron-bin
_pkgname=simplenote
pkgver=1.4.0
pkgrel=1
pkgdesc="The simplest way to keep notes"
arch=('x86_64')
url="https://github.com/Automattic/simplenote-electron"
license=('GPL2')
depends=('gcc-libs' 'gconf' 'alsa-lib' 'nss' 'libxtst' 'gtk2' 'libxss')
provides=('simplenote')
source=("https://github.com/Automattic/simplenote-electron/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-amd64.deb")

sha256sums=('44ee4a040913da78462b5b1ca950ba3b46cd7087aae26e0e11fb6306f9eeb34b')
# Warning: the release deb file has been known to be silently modified,
# resulting in a different checksum. If the checksum fails to validate, this is
# most likely the cause. If you are concerned about the security implications
# of this, please do not install this package. The web app at
# https://app.simplenote.com/ may better suit.
#
# This issue has been raised with Automattic on github: https://github.com/Automattic/simplenote-electron/issues/759
# See also related conversation on the aur: https://aur.archlinux.org/packages/simplenote-electron-bin/


package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"

  mkdir -p ${pkgdir}/usr/bin/
  ln -s /opt/Simplenote/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
