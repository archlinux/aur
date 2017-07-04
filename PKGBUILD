# Maintainer: Erwin
pkgname=nxfilter
pkgver=4.1.3
pkgrel=1
pkgdesc="NxFilter DNS filter"
arch=('x86_64')
url=http://nxfilter.org/p3/
license=('custom')
depends=('java-runtime' 'unzip')
provides=("nxfilter")
source=("https://github.com/Erwinovitch/NxFilter/archive/master.zip")
install='nxfilter.install'
md5sums=('ab6b75807e71046d3cf88e262161aad6')

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
