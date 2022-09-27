# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=hw-probe
pkgver=1.6.5
pkgrel=1
pkgdesc="Tool to probe for hardware, check its operability and upload result to the Linux hardware DB: http://linux-hardware.org"
arch=('any')
url="https://github.com/linuxhw/hw-probe"
license=('GPLv2')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('42030ba2fb3f6fb0772ab34744fbb91a89b1b6a9b0ed99e861fa05ff86968fb1')
depends=('perl>=5' 'hwinfo' 'curl' 'dmidecode' 'pciutils' 'usbutils' 'net-tools' 'edid-decode' 'ddcutil' 'acpica')
optdepends=('hdparm' 'smartmontools' 'inxi' 'pnputils' 'efibootmgr')

package() {
  cd "$srcdir"/hw-probe-$pkgver
  install -dm755 "$pkgdir"/usr
  DESTDIR="$pkgdir" make install prefix=/usr
}
