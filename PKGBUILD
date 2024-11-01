# Maintainer: qbvt <qbouvet at outlook dot com>

# Metadata
#
pkgname=dolphin-squashfs-mount
pkgver=1.1
pkgrel=0
pkgdesc="Mount squashfs archives through dolphin's right-click menu"
arch=('any')
url="https://github.com/shvchk/dolphin-squashfs-mount"
license=('GPLv3')
depends=('dolphin' 'squashfuse')

# Sources
#
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shvchk/dolphin-squashfs-mount/archive/refs/tags/v1.1.tar.gz")
sha256sums=('81f05626ef4303a471c7883773d3990f20b2680348a8146e91c51c00cfe5896b')

package() {

  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Identify the directory for KDE service menu. 
  # See:
  #   - https://develop.kde.org/docs/apps/dolphin/service-menus/
  # If this directory changes frequently, we could even have: 
  #   $ kde_service_menu_dir="qtpaths --locate-dirs GenericDataLocation kio/servicemenus"
  kde_service_menu_dir="/usr/share/kio/servicemenus/"
  
  # Copy desktop file
  install -D -m0755 \
    -t "${pkgdir}${kde_service_menu_dir}" \
    "squashfs-mount.desktop"
}

#
# makepkg --printsrcinfo > .SRCINFO
#
