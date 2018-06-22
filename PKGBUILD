# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=hw-probe
pkgver=1.4
pkgrel=1
pkgdesc="Tool to probe for hardware, check its operability and upload result to the Linux hardware DB: http://linux-hardware.org"
arch=('any')
url="https://github.com/linuxhw/hw-probe"
license=('GPLv2')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('90f3ea83bf641348b209e4a2a910f65d836ae7828c0be0f660236ea413bc46bb')
depends=('perl>=5' 'hwinfo' 'curl' 'dmidecode' 'pciutils' 'usbutils' 'net-tools')
optdepends=('hdparm' 'smartmontools' 'inxi' 'pnputils')

package() {
  cd "$srcdir"/hw-probe-$pkgver
  install -dm755 "$pkgdir"/usr
  DESTDIR="$pkgdir" make install prefix=/usr
}
