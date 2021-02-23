# Maintainer: S Gara <swhaat @ github>

pybase=(pypylon)
pkgname=(python-pypylon)
pkgver=1.7.1
pkgrel=1
pkgdesc="The official python wrapper for the Basler pylon Camera Software Suite."
arch=('any')
license=('Basler AG')
url="https://github.com/basler/pypylon"
makedepends=('swig' 'gcc')
depends=('python' 'python-setuptools' 'pylon')

source=("${url}/archive/${pkgver}.tar.gz")

sha256sums=('50b992ea126e867064cd33cd9a7051848aee89a9aaaa83675e89dd1683545a2a')

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

