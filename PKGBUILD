# Maintainer: MapleProjects <eportillo898v2@gmail.com>
pkgname=maple-saturation-hyprland-git
pkgver=1.0.0.r4
pkgrel=1
pkgdesc="Screen color saturation and contrast control for Hyprland via GLSL shaders"
arch=('any')
url="https://github.com/MapleProjects/maple-saturation-hyprland"
license=('MIT')
depends=('hyprland' 'python-pyqt6')
makedepends=('git')
provides=('maple-saturation-hyprland')
conflicts=('maple-saturation-hyprland')
source=('git+https://github.com/MapleProjects/maple-saturation-hyprland.git')
sha256sums=('SKIP')

pkgver() {
  cd maple-saturation-hyprland
  echo "1.0.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd maple-saturation-hyprland
  install -Dm755 maple-saturation "$pkgdir/usr/bin/maple-saturation"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
