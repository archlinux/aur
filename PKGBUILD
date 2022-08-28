# Maintainer: Zesko
pkgname=snapper-snapshot-notification-git
pkgver=r4.94a129c
pkgrel=1
pkgdesc="The Desktop notification will appear when booting into Btrfs snapshot using Overlayfs."
arch=("any")
url="https://gitlab.com/Zesko/snapper-snapshot-notification.git"
license=("GPL3")
depends=('bash' 'libnotify')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+${url})
sha1sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  cp -vr usr etc "$pkgdir"
}
