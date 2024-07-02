# Maintainer: Zesko
pkgname=btrfs-desktop-notification
pkgver=1.0.0
pkgrel=2
pkgdesc="It notifies you on Desktop when booting into snapshot or BTRFS warning/error message appears from dmesg log"
arch=('any')
url="https://gitlab.com/Zesko/btrfs-desktop-notification"
license=('GPL3')
depends=('libnotify' 'dunst' 'systemd')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git" "snapper-snapshot-notification-git")
backup=("etc/${pkgname}.conf")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/Release-$pkgver/$pkgname-Release-$pkgver.tar.gz")
sha256sums=('d19252c2fb17fcc1956241829c70ed086a29e85ba1a42b0ceea8877c0a2f099d')

package() {
  cd "$srcdir/$pkgname-Release-$pkgver"
  cp -vr usr etc "$pkgdir"
}
