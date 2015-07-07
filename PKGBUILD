# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=cpuset
pkgver=1.5.6
pkgrel=1
pkgdesc="Cpuset is a Python application to make using the cpusets facilities in the Linux kernel easier."
arch=('any')
url="https://code.google.com/p/cpuset/"
license=('GPL2')
depends=('python2')
options=('!emptydirs')
source=("https://cpuset.googlecode.com/files/cpuset-1.5.6.tar.gz"
	"add-cpuset-prefix.patch")
md5sums=('50a0251c31990bb4ad63312e356ffcb5'
         'f262662dbf0d3bb40aa652a9d06e82b4')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -Np1 -i "$srcdir/add-cpuset-prefix.patch"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
