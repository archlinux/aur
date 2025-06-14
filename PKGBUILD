# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=hw-probe
pkgver=1.6.6
pkgrel=2
pkgdesc="Probe for hardware, check its operability and upload result to https://linux-hardware.org"
arch=('any')
url="https://github.com/linuxhw/hw-probe"
license=('LGPL-2.1-or-later OR BSD-4-Clause')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('d8d31ed978095d0bd2ca7af51cfee8b97c97f7168ddb48a479a1632e1af84c7b')
depends=('perl' 'hwinfo' 'curl' 'dmidecode' 'pciutils' 'usbutils' 'net-tools' 'v4l-utils' 'ddcutil' 'acpica')
optdepends=('hdparm' 'smartmontools' 'inxi' 'pnputils' 'efibootmgr')

package() {
  cd "$srcdir"/hw-probe-$pkgver
  install -dm755 "$pkgdir"/usr
  DESTDIR="$pkgdir" make install prefix=/usr
}
