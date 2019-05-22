# Maintainer: S Gara <swhaat @ github>

pybase=(pypylon)
pkgname=(python-pypylon)
pkgver=1.4.0
pkgrel=2
pkgdesc="The official python wrapper for the Basler pylon Camera Software Suite."
arch=('any')
license=('Basler AG')
url="https://github.com/basler/pypylon"
makedepends=('swig' 'gcc')
depends=('python' 'python-setuptools' 'pylon')

source=("${url}/archive/${pkgver}.tar.gz")

sha256sums=('0623770e7574de480e5799f72e5fa519c98c62c093b18d4ce73b5f5a1bd710ee')

build()
{
	cd "${srcdir}/${pybase}-${pkgver}"
	python setup.py build
}

package_python-pypylon()
{
	cd "${srcdir}/${pybase}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

