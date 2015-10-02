# Maintainer: Marcel Hoppe <hoppe.marcel@gmail.com>
# https://github.com/sumdog/ath10k-firmware

_gituser=sumdog
_gitname=ath10k-firmware
_gitver=5faf5bb7c7413f9bb332693179de54cca6fff58e

pkgname=firmware_ath10k-qca6174
pkgbase=${pkgname}
pkgver=0.1
pkgrel=1
pkgdesc='firmware for Atheros Qualcomm Killer N1525 Wireless-AC [168c:003e]'
arch=('any')
url="https://github.com/$_gituser/$_gitname"
license=('GPL')
source=("https://github.com/$_gituser/$_gitname/archive/$_gitver.tar.gz"
				"ath10k.conf")
md5sums=('9508fef27520ce82b9f33b453f6344a8'
				 'fce5dbe873ca616de7d519cb55af8e68')

package() {
  cd "$srcdir/"
  mkdir -p $pkgdir/etc/modprobe.d
  cp ath10k.conf $pkgdir/etc/modprobe.d/ath10k.conf
  cd "$_gitname-$_gitver/ath10k"
  DESTDIR="$pkgdir/lib/firmware/ath10k/"
  mkdir -p $DESTDIR
  cp -r QCA6174 "$DESTDIR"
}
