_pkgname=snapper-snapshot-notification
pkgname="${_pkgname}-git"
pkgver=1.0.1
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
  install -dv "${pkgdir}/usr/bin"
  install -dv "${pkgdir}/etc/xdg/autostart"
  cd "$srcdir/$_pkgname"
  cp usr/bin/snapper-detects-snapshot $pkgdir/usr/bin/
  cp etc/xdg/autostart/snapper-detects-snapshot.desktop $pkgdir/etc/xdg/autostart/
}
