# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jekyll Wu <adaptee at gmail dot com>
# Contributor: Jacco Koning <archlinux@menollo.nl>, with help from qwak
# Contributor: twa022 <twa022@gmail.com>

pkgname=usb-creator
pkgver=0.3.2
pkgrel=1
pkgdesc="Create bootable USB from a LiveCD or disc image of Ubuntu"
arch=('any')
url="https://launchpad.net/usb-creator"
license=('GPL3')
depends=('udisks2' 'syslinux' 'parted' 'dosfstools' 'mtools' 'cdrkit'
         'python-dbus' 'python-gobject' 'hicolor-icon-theme')
makedepends=('python-distutils-extra')
optdepends=('python-pyqt5: for KDE/QT5 frontend' 'gtk3: for GTK frontend')
install=usb-creator.install
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.tar.xz")
sha256sums=('fbbd79fa8a6b4365b620bdd1bfa4049b28d9403e3bd427adf0f2a87193a22e97')

package() {
  cd $pkgname-$pkgver

  python3 setup.py install --root="$pkgdir/" --optimize=1

  # FIXME: install manual pages
  install -d "$pkgdir"/usr/share/man/man8
  install -Dm0644 man/$pkgname-{gtk,kde}.8 "$pkgdir"/usr/share/man/man8
}
