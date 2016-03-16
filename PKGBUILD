# Maintainer: Pablo Lezaeta <prflr88@gmail.com>
# Contributor: Christoph Hoopmann <choopm at 0pointer.org>
# Contributor: Dylon Edwards <deltaecho@archlinux.us>

pkgname=bfa-firmware
pkgver=3.2.23.0
_pkgver=3.2.23.0-2.el6
pkgrel=8
pkgdesc="Brocade Fibre Channel HBA Firmware"
arch=('any')
license=('custom')
depend=('udev')
url="http://driverdownloads.qlogic.com/QLogicDriverDownloads_UI/SearchByOs.aspx?ProductCategory=39&OsCategory=2&Os=65&OsCategoryName=Linux&ProductCategoryName=Fibre+Channel+HBAs&OSName=Linux+Red+Hat+%2864-bit%29"
source=("ftp://195.220.108.108/linux/centos/6.7/os/x86_64/Packages/$pkgname-$_pkgver.noarch.rpm")

build() {
	bsdtar xvf "$pkgname-$_pkgver.noarch.rpm"
}

package() {
	mkdir -p "$pkgdir/usr/lib/firmware"
	cp -rav "$srcdir/lib/firmware/"*.bin "$pkgdir/usr/lib/firmware/"
	install -Dm644 "$srcdir/usr/share/doc/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
	
	rm "$pkgdir/usr/lib/firmware/cbfw-3.2.1.1.bin"
	rm "$pkgdir/usr/lib/firmware/cbfw-3.2.3.0.bin"
	rm "$pkgdir/usr/lib/firmware/ct2fw-3.2.1.1.bin"
	rm "$pkgdir/usr/lib/firmware/ct2fw-3.2.3.0.bin"
	rm "$pkgdir/usr/lib/firmware/ctfw-3.2.1.1.bin"
	rm "$pkgdir/usr/lib/firmware/ctfw-3.2.3.0.bin"
}

md5sums=('708d8b3bce0564692a928bcc3a582f56') 
