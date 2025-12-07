# Maintainer: Zesko
pkgname=btrfs-desktop-notification
pkgver=1.4.0
pkgrel=1
pkgdesc="Notifies you on the desktop when booting into a read-only system or when BTRFS warning/error messages appear in the dmesg log."
arch=('any')
url="https://gitlab.com/Zesko/btrfs-desktop-notification"
license=('GPL3')
depends=('libnotify' 'systemd')
optdepends=('dunst')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git" "snapper-snapshot-notification-git")
backup=("etc/${pkgname}.conf")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6e453262b88a37a8d434b863d79fa241db87dac6edb8994af61bc090f899ca00')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm 755 "usr/share/doc/${pkgname}/"
  cp -r screenshots README.md CHANGELOG.md "usr/share/doc/${pkgname}/"
  cp -r usr etc "$pkgdir"
}
