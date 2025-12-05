# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=openxenmanager-xcpng-git
pkgver=0.0.r83.r293.ga2d497e
pkgrel=1
pkgdesc='Opensource XCP-NG Management Interface'
arch=('any')
license=('GPL2')
url="https://github.com/oytunistrator/openxenmanager-xcpng"
depends=('python' 'python-gobject' 'gtk3' 'python-configobj' 'python-raven' 'gtk-vnc')
makedepends=('python' 'python-setuptools' 'git')
#checkdepends=('python-pytest')
conflicts=('openxenmanager-xcpng')
provides=('openxenmanager-xcpng')
source=('git+https://github.com/oytunistrator/openxenmanager-xcpng.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/openxenmanager-xcpng"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

#check() {
#	cd "$srcdir/openxenmanager-xcpng"
#	pytest
#}

package() {
	cd "$srcdir/openxenmanager-xcpng"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
