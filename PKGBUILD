# Maintainer: Pablo Lezaeta <prflr88@gmail.com>
# Contributor: Christoph Hoopmann <choopm at 0pointer.org>

pkgname=bfa-firmware
pkgver=3.2.21.1
_pkgver=3.2.21.1-4.fc21
pkgrel=6
pkgdesc="Brocade Fibre Channel HBA Firmware"
arch=('any')
license=('custom')
depend=('udev')
url=("http://www.brocade.com/services-support/drivers-downloads/CNA/Linux.page")
source=("ftp://195.220.108.108/linux/fedora/linux/development/rawhide/i386/os/Packages/b/$pkgname-$_pkgver.noarch.rpm")

build(){
  bsdtar xvf $pkgname-$_pkgver.noarch.rpm
}

package(){
  mkdir -p $pkgdir/usr/lib/firmware
  cp -rav $srcdir/lib/firmware/*.bin $pkgdir/usr/lib/firmware/
  install -Dm644 $srcdir/usr/share/doc/$pkgname/LICENSE $pkgdir/usr/share/doc/$pkgname/LICENSE
}

md5sums=("4a59e2239ccf79b112559d68182ba258")
