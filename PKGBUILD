# Maintainer: Daniel Peukert <dan.peukert@gmail.com> (based on the PKGBUILD from cloudprint-cups-git by mortzu and zizzfizzix)
pkgname=cloudprint-cups
pkgver=20160502
pkgrel=2
pkgdesc='Google Cloud Print driver for CUPS, allows printing to printers hosted on Google Cloud Print.'
arch=('any')
url='https://github.com/simoncadman/CUPS-Cloud-Print'
license=('GPL3')
depends=('python2' 'python2-pycups' 'python2-httplib2' 'python2-six')
makedepends=('cups')
provides=('cloudprint-cups' 'cupscloudprint')
conflicts=('cloudprint-cups' 'cloudprint-cups-git' 'cupscloudprint')
options=(!emptydirs)
install=cloudprint-cups.install
source=("https://github.com/simoncadman/CUPS-Cloud-Print/archive/$pkgver.tar.gz")
md5sums=('c8fffd89b94032c562aa43c924b94a17')

build() {
	cd "$srcdir/CUPS-Cloud-Print-$pkgver"
	./configure --prefix /usr
	make
}

package() {
	cd "$srcdir/CUPS-Cloud-Print-$pkgver"
	NOPERMS=1 make DESTDIR="$pkgdir" install
}
