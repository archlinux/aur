# Maintainer: Erwin
pkgname=nxfilter
pkgver=4.1.3.p1
pkgrel=1
pkgdesc="NxFilter DNS filter"
arch=('x86_64')
url=http://nxfilter.org/p3/
license=('custom')
depends=('java-runtime' 'unzip')
provides=("nxfilter")
source=("https://github.com/Erwinovitch/NxFilter/archive/master.zip")
install='nxfilter.install'
md5sums=('56c85c2718a85607fced582900e7052f')

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr"
	
	# Provides the init script for those whom need it
	cp -dr --no-preserve=ownership "$srcdir/NxFilter-master/etc"		"$pkgdir"

	# Provides the systemd scripts
	cp -dr --no-preserve=ownership "$srcdir/NxFilter-master/lib"	"$pkgdir/usr"

	# Provides the program itself
	cp -dr --no-preserve=ownership "$srcdir/NxFilter-master/nxfilter"	"$pkgdir"
}


