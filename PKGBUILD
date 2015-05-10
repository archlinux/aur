# Maintainer: K1412 <jonathan@opensides.be>
pkgname=fusiondirectory-plugin-database-connector
pkgver=1.0.8.7
pkgrel=1
pkgdesc="Plugin that add database-connector for FusionDirectory."
arch=('any')
url="http://fusiondirectory.org/"
license=('LGPL')

source=("http://repos.fusiondirectory.org/sources/1.0/fusiondirectory/fusiondirectory-${pkgver}.tar.gz")
md5sums=('5d10f985087bc1efad2752f8c1128d5e')

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
