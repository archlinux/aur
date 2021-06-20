# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=python-maxfield-git
pkgver=4.0.r18.gc12493f
pkgrel=1
pkgdesc='An Ingress Linking and Fielding Strategy Generator'
arch=('any')
license=('GPL3')
url="https://github.com/tvwenger/maxfield"
depends=('python-numpy' 'python-networkx' 'python-scipy' 'python-or-tools' 'python-matplotlib' 'python-imageio' 'python-gifsicle')
makedepends=('python' 'python-setuptools' 'git')
conflicts=('python-maxfield')
provides=('python-maxfield')
source=('git+https://github.com/tvwenger/maxfield.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/maxfield"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package () {
	cd "$srcdir/maxfield"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
