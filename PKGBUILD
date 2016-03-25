# Maintainer: Sander Boom <sanderboom at gmail dot com>
# Contributor: esclapion <esclapion[at]gmail[dot]com>
# Author: esclapion <esclapion[at]gmail[dot]com>

pkgname=mhwd-chroot-extended
_pkgname=mhwd-chroot
pkgver=1.4.1
pkgrel=1
pkgdesc="mhwd-chroot updated to support nvme storage (sda/hda/nvme)"
url="https://forum.manjaro.org/index.php?topic=21472.0"
arch=('any')
license=('GPL')
depends=('')
provides=('mhwd-chroot')
conflicts=('mhwd-chroot')
optdepends=('gksu: gnome gui for su'
            'kdesu: kde gui for su')
source=("https://github.com/sanderboom/mhwd-chroot/archive/master.tar.gz")
sha256sums=('de79e625d704495fa68ba5821d28d8bac759e30b6d2bf4a09fb23d06a8efa227')

package() {
  cd "${srcdir}/${_pkgname}-master"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${_pkgname}-shell" "${pkgdir}/usr/bin/${_pkgname}-shell"
  install -Dm644 "${_pkgname}-gksu.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-gksu.desktop"
  install -Dm644 "${_pkgname}-kdesu.desktop" "${pkgdir}/usr/share/applications/${_pkgname}-kdesu.desktop"
}
