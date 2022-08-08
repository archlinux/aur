# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Slimbook <dev at slimbook dot es>
pkgname=slimbookamdcontroller
pkgver=0.3.8beta
pkgrel=1
pkgdesc="Application for the performance management of AMD processors"
arch=('any')
url="https://github.com/slimbook/slimbookamdcontroller"
license=('GPL')
depends=('dbus-python' 'gtk3' 'libayatana-appindicator' 'libnotify' 'python-gobject'
         'python-pillow' 'python-pyamdgpuinfo' 'ryzenadj' 'systemd-libs')
install="$pkgname.install"
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('dff122d8c4483b18e5c6880a41b123372ed11f1945277b52c55d7ad9080356e2')

package() {
  bsdtar xf data.tar.xz -C "$pkgdir"

  ln -s /usr/bin/ryzenadj "$pkgdir/usr/share/$pkgname/"

  # App permissions
  chmod +x "$pkgdir/usr/lib/systemd/system-sleep/$pkgname"
  chmod -R 755 "$pkgdir/usr/share/$pkgname/src/"
}
