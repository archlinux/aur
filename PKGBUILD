# Maintainer: Radek Podgorny <radek@podgorny.cz>
pkgname='python-bcm2835-git'
pkgver=r8.cfce6e0
pkgrel=1
pkgdesc="Python wrapper for the bcm2835 library"
arch=('any')
url="https://github.com/rpodgorny/PyBCM2835"
license=('GPL')
depends=('python')
makedepends=('git')
#options=(!emptydirs)
source=('git+https://github.com/rpodgorny/PyBCM2835')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/PyBCM2835"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/PyBCM2835"
	python setup.py install --root="$pkgdir"/ --optimize=1

	#install -d $pkgdir/usr/lib/systemd/system
	#install faddnsc.service $pkgdir/usr/lib/systemd/system/

	#install -d $pkgdir/etc
	#install faddnsc.ini $pkgdir/etc/faddnsc.conf

	#install -d $pkgdir/usr/bin
	#install nsupdate.py $pkgdir/usr/bin/nsupdate
	#install server.py $pkgdir/usr/bin/nsupdate-server
	#install nsupdate-zone.py $pkgdir/usr/bin/
}
