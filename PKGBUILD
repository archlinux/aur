# Maintainer: Zesko
pkgname=btrfs-desktop-notification
pkgver=1.1.1
pkgrel=1
pkgdesc="Notifies you on the desktop when booting into a read-only system or when BTRFS warning/error messages appear in the dmesg log."
arch=('any')
url="https://gitlab.com/Zesko/btrfs-desktop-notification"
license=('GPL3')
depends=('libnotify' 'dunst' 'systemd')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git" "snapper-snapshot-notification-git")
backup=("etc/${pkgname}.conf")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('817f49dad662297d2aae57814a80a268f8a2b92502eb39513bffcbdfb1e11953')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cp -vr usr etc "$pkgdir"
}
