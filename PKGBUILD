# Maintainer: Maximilian Stahlberg <maximilian.stahlberg tu-berlin de>

pkgname=python-concurrencytest
pkgver=0.1.2
pkgrel=4
pkgdesc='Python testtools extension for running unittest suites concurrently.'
arch=('any')
url='https://github.com/cgoldberg/concurrencytest'
license=('GPL3')
depends=('python-testtools' 'python-subunit')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/ba/8a/8286de6d3aa9a3c4765cb3dd73515d91129f012a61e0ec8578c733ea2d27/concurrencytest-${pkgver}.tar.gz")
md5sums=('773d9a8be83fc043a32a25b6665bf59b')

build() {
	cd "${srcdir}/concurrencytest-${pkgver}"
	python setup.py build
}

check() {
	cd "${srcdir}/concurrencytest-${pkgver}/build/lib"
	python -Bc "import concurrencytest"
}

package() {
	cd "${srcdir}/concurrencytest-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
