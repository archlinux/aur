# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-setuptools_trial
pkgname=(python2-setuptools_trial)
pkgver=0.6.0
pkgrel=1
pkgdesc="Setuptools plugin that makes unit tests execute with trial instead of pyunit"
arch=('any')
license=('SPL')
url="https://github.com/rutsky/setuptools-trial"
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/6c/d8/2ec30d50a37c90f8b48b22a50e96d4c50fec7e05ca1557bb814dc219ffc3/setuptools_trial-0.6.0.tar.gz")
md5sums=('bca42190adf631b213846c2b33f3676f')

build() {
	cd "${srcdir}/setuptools_trial-${pkgver}"
	python2 setup.py build
}

package_python2-setuptools_trial() {
	depends=('python2' 'python2-twisted')

	cd "setuptools_trial-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

	install -Dm644 COPYING.SPL.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING.SPL.txt"
}
