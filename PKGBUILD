# Maintainer: gearfox98 <gearfox98@gmail.com>
pkgname=time-admin-git
pkgver=1.0.0
pkgrel=2
pkgdesc="A GTK3 tool written in Python to change system time settings. Made with XFCE in mind."
arch=('any')
url="https://github.com/Archie-Project/time-admin"
license=('GPL3')
depends=(
  'python'
  'python-gobject'
  'python-pydbus'
  'python-cairo'
  'gtk3'
  'polkit'
)
makedepends=('git')
optdepends=(
  'xfce4: to integrate with XFCE settings panel'
)
conflicts=('gnome-system-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Archie-Project/time-admin/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/time-admin-$pkgver"

  # Install the main application script to /usr/bin
  install -Dm755 "time-admin" "$pkgdir/usr/bin/time-admin"

  # Install the .desktop file
  install -Dm644 "time-admin.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
