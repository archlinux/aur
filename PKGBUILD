# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=hw-probe
pkgver=1.2
pkgrel=1
pkgdesc="Tool to probe for hardware, check its operability and upload result to the Linux hardware DB: http://linux-hardware.org"
arch=('any')
url="https://github.com/linuxhw/hw-probe"
license=('GPLv2')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('71c6d58afd0ebca7f81c1c3b18c467f41478f3ee21304561cb2a757fb6b31a31')
depends=('perl>=5' 'hwinfo' 'curl' 'dmidecode' 'pciutils' 'usbutils' 'net-tools')
optdepends=('hdparm' 'smartmontools' 'inxi' 'pnputils')

package() {
  cd "$srcdir"/hw-probe-$pkgver
  install -dm755 "$pkgdir"/usr
  DESTDIR="$pkgdir" make install prefix=/usr
}
