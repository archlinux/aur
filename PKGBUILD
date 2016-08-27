# Maintainer: Przemysław Buczkowski <przemub at przemub dot pl>

pkgname='ricoh-sp100-git'
pkgver='v0.3.r22.gef4c12d'
pkgrel=1

pkgdesc='CUPS driver for Ricoh Aficio SP 100 and SP 200 family printers'
arch=('any')
url='https://github.com/madlynx/ricoh-sp100/'
license=('unknown')

depends=('cups' 'jbigkit' 'imagemagick' 'ghostscript')
optdepends=('inotify-tools: asynchronous printing support')
makedepends=('git')

source=('git://github.com/madlynx/ricoh-sp100')
md5sums=('SKIP')

pkgver() {
	cd "ricoh-sp100"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "ricoh-sp100"

	mkdir -p $pkgdir/usr/share/cups/model
	mkdir -p $pkgdir/usr/lib/cups/filter

	cp *.ppd $pkgdir/usr/share/cups/model
	cp pstoricohddst-gdi $pkgdir/usr/lib/cups/filter
}

