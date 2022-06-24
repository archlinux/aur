# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=hw-probe
pkgver=1.6.4
pkgrel=1
pkgdesc="Tool to probe for hardware, check its operability and upload result to the Linux hardware DB: http://linux-hardware.org"
arch=('any')
url="https://github.com/linuxhw/hw-probe"
license=('GPLv2')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('3dc0d0b4b7a9ff65a7937f1b1ca3a36b9360ead0d6770f2a9abceff486d44274')
depends=('perl>=5' 'hwinfo' 'curl' 'dmidecode' 'pciutils' 'usbutils' 'net-tools' 'edid-decode' 'ddcutil')
optdepends=('hdparm' 'smartmontools' 'inxi' 'pnputils' 'efibootmgr')

package() {
  cd "$srcdir"/hw-probe-$pkgver
  install -dm755 "$pkgdir"/usr
  DESTDIR="$pkgdir" make install prefix=/usr
}
