# Maintainer: jtts
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=flasher-harmattan
pkgver=3.12.1
pkgrel=5
pkgdesc="Maemo Flasher-3.12.1 Tool for Harmattan"
arch=('i686' 'x86_64')
url="https://wiki.maemo.org/Flashing_N9"
license=('custom')
depends=('libusb-compat')
conflicts=('flasher')
install=flasher-harmattan.install
source=('LICENSE.txt'
        'flasher-harmattan.conf')
sha256sums=('a3c2014fb8c45a209a77f69bbda3ee2e726a995999e3e7c6aa37ce895accb43d'
            '01c53815c3a300a3c4174f999e6eabbaa654e6cd2edeb0861ff388dfb7e739fa')
source_x86_64=('flasher_3.12.1_amd64.deb')
source_i686=('flasher_3.12.1_i386.deb')
sha256sums_x86_64=('c1b613952af32c1484cfcdf0b16d652b11770d77aa549d27c33a02dc2b95ac82')
sha256sums_i686=('bd528247cdba30f6f87283554e76a2a4134f2e725f6636f998a89e47128d16af')

package() {
  cd "$srcdir"
  tar -xnf "$srcdir/data.tar.gz"

  install -m755 -d $pkgdir/{etc/modprobe.d,usr/{bin,share/doc/flasher,share/licenses/flasher-harmattan}}
  install -m755 usr/bin/flasher $pkgdir/usr/bin/flasher
  install -m644 usr/share/doc/flasher/copyright $pkgdir/usr/share/doc/flasher/copyright
  install -m644 usr/share/doc/flasher/changelog.gz $pkgdir/usr/share/doc/flasher/changelog.gz
  install -m644 LICENSE.txt $pkgdir/usr/share/licenses/flasher-harmattan/LICENSE.txt
  install -m644 flasher-harmattan.conf $pkgdir/etc/modprobe.d/flasher-harmattan.conf
}