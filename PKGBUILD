# Maintainer: MapleProjects <eportillo898v2@gmail.com>
# LEGACY PACKAGE. Superseded by maple-saturation-plasma-git after the project
# was renamed to maple-saturation-plasma. Pinned to the last commit that still
# shipped the maple-saturation-control binary, pending deletion from the AUR.
pkgname=maple-saturation-control-git
pkgver=1.0.0.r4.g23d2558
pkgrel=1
pkgdesc="LEGACY: saturation and gamma control for KDE Plasma 6 Wayland (use maple-saturation-plasma-git)"
arch=('any')
url="https://github.com/MapleProjects/maple-saturation-plasma"
license=('GPL-3.0-only')
depends=('python' 'python-pyqt6' 'argyllcms' 'colord' 'iccxml')
provides=('maple-saturation-control')
conflicts=('maple-saturation-control')
source=("https://github.com/MapleProjects/maple-saturation-plasma/archive/23d2558362cedf5cc5f81573af9b64cf26c2dbde.tar.gz")
sha256sums=('53b8211739d26bd3d85ac5377b713db588ef069baa3c8cf5dc3d5cf4bd7f8640')

package() {
  cd "$srcdir"/maple-saturation-plasma-23d2558362cedf5cc5f81573af9b64cf26c2dbde

  install -Dm755 maple_saturation_control.py "$pkgdir/usr/bin/maple-saturation-control"
  install -Dm644 MapleSaturation.desktop "$pkgdir/usr/share/applications/maple-saturation-control.desktop"

  sed -i 's|Exec=.*|Exec=/usr/bin/maple-saturation-control|' "$pkgdir/usr/share/applications/maple-saturation-control.desktop"
}