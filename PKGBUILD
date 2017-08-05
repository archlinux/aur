# Maintainer: Niklas <dev@n1klas.net>

pkgbase=python-chainmap
pkgname=("python-chainmap" "python2-chainmap")
_name=chainmap
pkgver=1.0.2
pkgrel=3
pkgdesc="Backport/clone of ChainMap for py26, py32, and pypy3"
arch=("any")
url="https://bitbucket.org/jeunice/chainmap"
license=("PSF")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=("405da3bce9913bfb33e6e497803b447b60d12ab44031ca357626143e087e0526")

prepare() {
	cp -a $_name-$pkgver{,-python2}
}

package_python-chainmap() {
	depends=('python')

	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-chainmap() {
	depends=('python2')

	cd "${srcdir}/${_name}-${pkgver}-python2"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
