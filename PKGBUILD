# Maintainer: Zesko
pkgname=btrfs-desktop-notification
pkgver=1.2.0
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
sha256sums=('fc448eec8fb95d493f5e7a4cec66619e630a74a9a272ff30b5fa69aecf983f3c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cp -vr usr etc "$pkgdir"
}
