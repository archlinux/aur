# Maintainer: K1412 <jonathan@opensides.be>
pkgname=fusiondirectory-plugin-database-connector
pkgver=1.0.9.1
pkgrel=1
pkgdesc="Plugin that add database-connector for FusionDirectory."
arch=("any")
url="http://fusiondirectory.org/"
license=("LGPL")
depends=("fusiondirectory>=$pkgver")

source=("http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-${pkgver}.tar.gz")
md5sums=('9343182b92e3e8a2a14654ec37a16117' '53720c4bef3494d549ac0986f05ccfb1')

prepare() {
  # In srcdir
  cd "$srcdir/fusiondirectory-$pkgver"
}

package() {
	# In srcdir
	cd "$srcdir/fusiondirectory-$pkgver"

	# Copy docs
	mkdir -p $pkgdir/usr/share/doc/$pkgname/
	cp ./AUTHORS ./Changelog ./COPYING $pkgdir/usr/share/doc/$pkgname/

	# Move executables
	mkdir -p $pkgdir/usr/share/fusiondirectory/include/
	cp ./include/class_databaseManagement.inc $pkgdir/usr/share/fusiondirectory/include/
}
