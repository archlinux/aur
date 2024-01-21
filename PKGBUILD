# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Slimbook <dev at slimbook dot es>
pkgname=slimbookamdcontroller
pkgver=0.3.9beta
pkgrel=1
pkgdesc="Application for the performance management of AMD processors"
arch=('any')
url="https://github.com/slimbook/slimbookamdcontroller"
license=('GPL-3.0-or-later')
depends=('dbus-python' 'gtk3' 'libayatana-appindicator' 'libnotify' 'mokutil'
         'python-gobject' 'python-pillow' 'python-pyamdgpuinfo' 'ryzenadj' 'systemd-libs')
install="$pkgname.install"
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('76a645a7fcb710e91123b8e1bd0e483e1ec080c5e617e6cb1cb32c1f3d9b9b22')

package() {
  bsdtar xf data.tar.xz -C "$pkgdir"

  ln -s /usr/bin/ryzenadj "$pkgdir/usr/share/$pkgname/"

  # App permissions
  chmod +x "$pkgdir/usr/lib/systemd/system-sleep/$pkgname"
  chmod -R 755 "$pkgdir/usr/share/$pkgname/src/"
}
