# Maintainer: Erwin
pkgname=nxfilter
pkgver=4.1.5
pkgrel=2
pkgdesc="NxFilter DNS filter"
arch=('i686' 'x86_64')
url=http://nxfilter.org/p3/
license=('custom')
depends=('java-runtime')
provides=("nxfilter")
source=("https://github.com/Erwinovitch/NxFilter/raw/master/Release/4.1.5/nxfilter.zip")
install='nxfilter.install'
md5sums=('SKIP')

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr"
	
	# Provides the init script for those whom need it
	cp -dr --no-preserve=ownership "$srcdir/nxfilter/etc"		"$pkgdir"

	# Provides the systemd scripts
	cp -dr --no-preserve=ownership "$srcdir/nxfilter/lib"	"$pkgdir/usr"

	# Provides the program itself
	cp -dr --no-preserve=ownership "$srcdir/nxfilter/nxfilter"	"$pkgdir"

}


