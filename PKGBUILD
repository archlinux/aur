# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=mythutil-git
pkgver=r33.b773d36
pkgrel=1
pkgdesc="Miscellanous Utilities for MythTV"
arch=('any')
url='https://github.com/garybuhrmaster/mythutil'
license=('Apache')
makedepends=('git')
source=("git+https://github.com/garybuhrmaster/mythutil.git")
sha256sums=('SKIP')
depends=('python-requests' 'python-systemd')
conflicts=('mythutil')
provides=('mythutil')

pkgver() {
  cd "mythutil"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/mythutil"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/licenses/mythutil"
  install -d "${pkgdir}/usr/share/doc/mythutil"
  install -m755 {MythUtil-Channel-HDHR-channelCheck,MythUtil-Channel-HDHR-visibilityCheck,MythUtil-Channel-XMLTV-getLineup,MythUtil-Channel-videosource,MythUtil-Channel-visibility} "${pkgdir}/usr/bin/"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/mythutil/"
  install -m644 README.md "${pkgdir}/usr/share/doc/mythutil/"
  install -m644 docs/{MythUtil-Channel-HDHR-channelCheck,MythUtil-Channel-XMLTV-getLineup,MythUtil-Channel-videosource,MythUtil-Channel-HDHR-visibilityCheck} "${pkgdir}/usr/share/doc/mythutil/"
}

# vim:set ts=2 sw=2 et:
