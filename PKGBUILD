# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=slimbookamdcontroller
pkgver=0.3.3beta
pkgrel=1
pkgdesc="Application for the performance management of AMD processors"
arch=('any')
url="https://slimbook.es"
license=('GPL')
depends=('dbus-python' 'libappindicator-gtk3' 'libnotify' 'python-gobject'
         'python-pillow' 'ryzenadj' 'systemd-libs')
source=("https://launchpad.net/~slimbook/+archive/ubuntu/slimbook/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('c0b751e4d805f89559e5de2902d8656ed03ecb5d4aa4d3e02aa61a3ada8a1f2a')

package() {
  bsdtar xf data.tar.xz -C "$pkgdir"
  mv "$pkgdir/bin/$pkgname-pkexec" "$pkgdir/usr/bin/"
  rm -rf "$pkgdir/bin"

  ln -s /usr/bin/ryzenadj "$pkgdir/usr/share/$pkgname"
  chmod +x "$pkgdir/usr/lib/systemd/system-sleep/$pkgname"
}
