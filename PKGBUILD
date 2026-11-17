# Maintainer: MapleProjects <eportillo898v2@gmail.com>
pkgname=maple-saturation-plasma-git
_pkgname=maple-saturation-plasma
pkgver=1.0.0.r5.ga7e4aa0
pkgrel=1
pkgdesc="Screen saturation and gamma control for KDE Plasma 6 Wayland via ICC profiles"
arch=('any')
url="https://github.com/MapleProjects/maple-saturation-plasma"
license=('GPL-3.0-only')
depends=('python' 'python-pyqt6' 'argyllcms' 'colord' 'iccxml')
makedepends=('git')
provides=('maple-saturation-plasma')
conflicts=('maple-saturation-plasma')
source=("git+https://github.com/MapleProjects/maple-saturation-plasma.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "1.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 maple_saturation_plasma.py "$pkgdir/usr/bin/maple-saturation-plasma"
  install -Dm644 maple-saturation-plasma.desktop "$pkgdir/usr/share/applications/maple-saturation-plasma.desktop"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}