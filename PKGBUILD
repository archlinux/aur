# Maintainer: S Gara <swhaat @ github>

pybase=(pypylon)
pkgname=(python-pypylon)
pkgver=1.7.4
pkgrel=1
pkgdesc="The official python wrapper for the Basler pylon Camera Software Suite."
arch=('any')
license=('Basler AG')
url="https://github.com/basler/pypylon"
makedepends=('swig' 'gcc')
depends=('python' 'python-setuptools' 'pylon')

source=("${url}/archive/${pkgver}.tar.gz")

sha256sums=('812bee0ba0aa8902610d137665d1a5af3ffdeadad494a1f4014c1ac87e78ca1b')

build()
{
	cd "${srcdir}/${pybase}-${pkgver}"
	PYLON_ROOT=/opt/pylon6 python setup.py build
}

package_python-pypylon()
{
	cd "${srcdir}/${pybase}-${pkgver}"
	PYLON_ROOT=/opt/pylon6 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

