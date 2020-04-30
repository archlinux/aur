# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Benjamin ROBIN <dev@benjarobin.fr>

_name=MT7630E
pkgname=mt7630-pcie-wifi-dkms
_commit=5193c55a055aed723bc78f77cc0b853582026eb6
#pkgver=2.1.0.r12.5193c55
pkgver=2.1.1
pkgrel=1
epoch=1
pkgdesc='MT7630e PCIe Wifi (DKMS)'
arch=('any')
url="https://github.com/neurobin/$_name"
license=('GPL')
depends=('dkms')
makedepends=('git')
optdepends=('linux-headers: If running standard kernel, otherwise find matching headers for your kernel')
#source=("git+$url.git#commit=$_commit")
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

package() {
  cd "$_name"

  install -d "$pkgdir/usr/src/mt7630e-$pkgver"
  cp -a btloader dkms.conf Makefile rt2x00 "$pkgdir/usr/src/mt7630e-$pkgver"
  install -Dm644 -t "$pkgdir/usr/lib/firmware" firmware/{BT/mt76x0.bin,Wi-FI/MT7650E234.bin}
}
