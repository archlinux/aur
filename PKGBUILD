# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Jekyll Wu, Jacco Koning, qwak, twa022

pkgname=usb-creator
pkgver=0.3.3
pkgrel=1
pkgdesc="Create bootable USB from a LiveCD or disc image of Ubuntu"
arch=('any')
url="https://launchpad.net/usb-creator"
license=('GPL3')
depends=('udisks2' 'syslinux' 'parted' 'dosfstools' 'mtools' 'cdrkit' 'python-dbus'
         'python-gobject')
makedepends=('python-distutils-extra')
optdepends=('python-pyqt5: for KDE/QT5 frontend'
            'gtk3: for GTK frontend')
install=usb-creator.install
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.tar.xz")
sha256sums=('1c81b4b5beaeaed69c7fb8d6f2751985c6c40d3aa8e5d0260dd699484b628599')

package() {
  cd $pkgname-0.3.2

  python3 setup.py install --root="$pkgdir/" --optimize=1

  # FIXME: install manual pages
  install -d "$pkgdir"/usr/share/man/man8
  install -Dm0644 man/$pkgname-{gtk,kde}.8 "$pkgdir"/usr/share/man/man8
}
