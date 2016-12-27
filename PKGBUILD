# Maintainer: Niklas <niklas at anio dot xyz>

pkgbase=python-chainmap
pkgname=("python-chainmap" "python2-chainmap")
_realname=chainmap
pkgver=1.0.2
pkgrel=2
pkgdesc="Backport/clone of ChainMap for py26, py32, and pypy3"
arch=("any")
url="https://bitbucket.org/jeunice/chainmap"
license=("PSF")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_realname:0:1}/${_realname}/${_realname}-${pkgver}.tar.gz")
sha256sums=("405da3bce9913bfb33e6e497803b447b60d12ab44031ca357626143e087e0526")

prepare() {
	cp -a $_realname-$pkgver{,-python2}
}

package_python-chainmap() {
	cd "${srcdir}/${_realname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-chainmap() {
	cd "${srcdir}/${_realname}-${pkgver}-python2"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}