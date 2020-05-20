# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=hw-probe
pkgver=1.6
pkgrel=1
pkgdesc="Tool to probe for hardware, check its operability and upload result to the Linux hardware DB: http://linux-hardware.org"
arch=('any')
url="https://github.com/linuxhw/hw-probe"
license=('GPLv2')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('de048be6aef357d3142c9e2327d6f79d205a42aa3396ad381ed319115d1c9a22')
depends=('perl>=5' 'hwinfo' 'curl' 'dmidecode' 'pciutils' 'usbutils' 'net-tools' 'edid-decode' 'ddcutil')
optdepends=('hdparm' 'smartmontools' 'inxi' 'pnputils' 'efibootmgr')

package() {
  cd "$srcdir"/hw-probe-$pkgver
  install -dm755 "$pkgdir"/usr
  DESTDIR="$pkgdir" make install prefix=/usr
}
