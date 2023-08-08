# Maintainer: S Gara <swhaat @ github>

pybase=(pypylon)
pkgname=(python-pypylon)
pkgver=2.2.0
pkgrel=1
pkgdesc="The official python wrapper for the Basler pylon Camera Software Suite."
arch=('any')
license=('Basler AG')
url="https://github.com/basler/pypylon"
makedepends=('swig' 'gcc')
depends=('python' 'python-setuptools' 'pylon')

source=("${url}/archive/${pkgver}.tar.gz")

sha256sums=('1ada6230dfdb0957ff1cdcc6428e3a638c5c153ba22efb5905ef468d5911f5cd')

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

