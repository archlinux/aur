# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=hw-probe
pkgver=1.6.5
pkgrel=2
pkgdesc="Probe for hardware, check its operability and upload result to https://linux-hardware.org"
arch=('any')
url="https://github.com/linuxhw/hw-probe"
license=('LGPL-2.1-or-later OR BSD-4-Clause')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('42030ba2fb3f6fb0772ab34744fbb91a89b1b6a9b0ed99e861fa05ff86968fb1')
depends=('perl' 'hwinfo' 'curl' 'dmidecode' 'pciutils' 'usbutils' 'net-tools' 'edid-decode' 'ddcutil' 'acpica')
optdepends=('hdparm' 'smartmontools' 'inxi' 'pnputils' 'efibootmgr')

package() {
  cd "$srcdir"/hw-probe-$pkgver
  install -dm755 "$pkgdir"/usr
  DESTDIR="$pkgdir" make install prefix=/usr
}
