# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=simplenote-electron-bin
pkgver=2.27.1
pkgrel=1
pkgdesc="The simplest way to keep notes"
arch=('x86_64' 'aarch64')
url="https://github.com/Automattic/simplenote-electron"
license=('GPL2')
depends=('nss' 'gtk3' 'libxss')
provides=('simplenote')
source_x86_64=("${url}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-arm64.deb")
sha256sums_x86_64=('07652e366637d7120c761f4f755d83479a40e9d807a0530dc7052f22750d5a34')
sha256sums_aarch64=('2b6302be74d715b0bb83b13b0df415182841e1c17a675ed9fb904e75dff85ac9')

# Warning: the release deb file has been known to be silently modified, resulting in a different checksum. 
# If the checksum fails to validate, this is most likely the cause. If you are concerned about the
# security implications of this, do not install this package.
# This issue has been raised and acknowledged by Automattic in Sep'18: https://github.com/Automattic/simplenote-electron/issues/759

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.gz"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/Simplenote/${pkgname%-electron-bin}" "${pkgdir}/usr/bin"
}
