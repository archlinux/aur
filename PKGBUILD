_pkgname=snapper-snapshot-notification
pkgname="${_pkgname}-git"
pkgver=1.0.0
pkgrel=1
pkgdesc="The Desktop notification will appear when booting into Btrfs snapshot using Overlayfs."
arch=("any")
url="https://gitlab.com/Zesko/${_pkgname}.git"
license=("GPL3")
makedepends=('git' 'libnotify')
provides=("snapper-snapshot-notification")
source=(git+${url})
sha256sums=("SKIP")

package() {
  cd "$srcdir/$_pkgname"
  sudo cp ./snapper-detects-snapshot /usr/bin/
  sudo cp ./snapper-detects-snapshot.desktop /etc/xdg/autostart/
}
