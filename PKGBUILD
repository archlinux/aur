# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgbase=python-setuptools_trial
pkgname=('python2-setuptools_trial')
pkgver=0.5.12
pkgrel=1
pkgdesc="Setuptools plugin that makes unit tests execute with trial instead of pyunit"
arch=('any')
license=('SPL')
url="http://pypi.python.org/pypi/setuptools_trial"
makedepends=('python2-setuptools' 'python2-twisted')
source=("http://pypi.python.org/packages/source/s/setuptools_trial/setuptools_trial-${pkgver}.tar.gz")
md5sums=('f16f4237c9ee483a0cd13208849d96ad')

build() {
	cd "${srcdir}/setuptools_trial-${pkgver}"
	python2 setup.py build
}

package_python2-setuptools_trial() {
	depends=('python2' 'python2-twisted')

	cd "${srcdir}/setuptools_trial-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

	install -Dm644 COPYING.SPL.txt \
		"$pkgdir/usr/share/licenses/$pkgname/COPYING.SPL.txt"
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
