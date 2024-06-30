# Maintainer: Zesko
pkgname=btrfs-desktop-notification-git
pkgver=r18.df4d25e
pkgrel=1
pkgdesc="It notifies you on Desktop when booting into snapshot or BTRFS warning/error message appears from dmesg log"
arch=('any')
url="https://gitlab.com/Zesko/btrfs-desktop-notification.git"
license=('GPL3')
depends=('libnotify' 'dunst' 'systemd')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "snapper-snapshot-notification-git")
backup=("etc/${pkgname%-git}.conf")
source=('git+https://gitlab.com/Zesko/btrfs-desktop-notification.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  cp -vr usr etc "$pkgdir"
}
