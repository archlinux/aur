# Maintainer: Tomas Groth <second@tgc.dk>
pkgbase='pysword'
pkgname='python-pysword'
pkgver=0.2.8
pkgrel=1
pkgdesc='A native Python2/3 reader module for the SWORD Project Bible Modules'
arch=('any')
license=('MIT')
url='https://gitlab.com/tgc-dk/pysword'
makedepends=('python-setuptools')
source=("https://gitlab.com/tgc-dk/pysword/-/archive/${pkgver}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('156dd20b892eca76cccb6bbe3ca8a482d315b747a8e677aa04b132b0b4735786')

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"

	msg 'Building Python 3...'
	python ./setup.py build
}

package_python-pysword() {
	depends=('python' 'python-setuptools')

	cd "${srcdir}/${pkgbase}-${pkgver}"

	python ./setup.py install --skip-build --root="$pkgdir/"
}
