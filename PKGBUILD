# Maintainer: Sergio Garnica <sergio.garnica@uol.de>

pybase=(pypylon)
pkgname=(python-pypylon)
pkgver=1.4.0
pkgrel=1
pkgdesc="The official python wrapper for the Basler pylon Camera Software Suite."
arch=('any')
license=('Basler AG')
url="https://github.com/basler/pypylon"
makedepends=('swig' 'gcc')
depends=('python' 'python-setuptools' 'pylon')

source=("git+${url}#tag=${pkgver}")

md5sums=('SKIP')

build()
{
	cd "${srcdir}/${pybase}"
	python setup.py build
}

package_python-pypylon()
{
	cd "${srcdir}/${pybase}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

