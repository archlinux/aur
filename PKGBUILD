# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=hw-probe
pkgver=1.6.6
pkgrel=3
pkgdesc="Probe for hardware, check its operability and upload result to https://linux-hardware.org"
arch=('any')
url="https://github.com/linuxhw/hw-probe"
license=('LGPL-2.1-or-later OR BSD-4-Clause')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('d8d31ed978095d0bd2ca7af51cfee8b97c97f7168ddb48a479a1632e1af84c7b')
depends=('perl' 'hwinfo' 'curl' 'dmidecode' 'pciutils' 'usbutils' 'net-tools' 'v4l-utils' 'ddcutil' 'acpica')
optdepends=(
  'hdparm: read IDE drive/driver parameters'
  'smartmontools: monitor S.M.A.R.T. enabled ATA and SCSI Hard Drives'
  'inxi: read system information via inxi'
  'efibootmgr: read information from the EFI Boot Manager'
  '7zip: used for benchmarking in -check-extended (and -check-7z)'
  'memtester: used in -check (and -check-memory)'
  'mesa-utils: for glxinfo and glxgears used in -check (and -check-graphics).'
  'perl-json-xs: JSON-formatted /root/HW_PROBE/LATEST/hw.info/devices.json'
)

package() {
  cd "$srcdir"/hw-probe-$pkgver
  install -dm755 "$pkgdir"/usr
  DESTDIR="$pkgdir" make install prefix=/usr
}
