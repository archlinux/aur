# Maintainer: S Gara <swhaat @ github>

pybase=(pypylon)
pkgname=(python-pypylon)
pkgver=2.3.0
pkgrel=1
pkgdesc="The official python wrapper for the Basler pylon Camera Software Suite."
arch=('any')
license=('Basler AG')
url="https://github.com/basler/pypylon"
makedepends=('swig' 'gcc')
depends=('python' 'python-setuptools' 'pylon')

source=("${url}/archive/${pkgver}.tar.gz")

sha256sums=('a198b02ba254b7a723737d706f7109b67a881dfb0aa9c50665b2a44dcb43d7c7')

build()
{
	cd "${srcdir}/${pybase}-${pkgver}"
	PYLON_ROOT=/opt/pylon python setup.py build
}

package_python-pypylon()
{
	cd "${srcdir}/${pybase}-${pkgver}"
	PYLON_ROOT=/opt/pylon python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

