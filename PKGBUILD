# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=cdist
pkgver=3.1.13
pkgrel=1
pkgdesc='A usable configuration management system'
arch=('any')
url='https://github.com/ungleich/cdist'
license=('GPL3')
depends=('python' 'openssh')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ungleich/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2891aec4b84333ad0a4eb523b8cb99c98037106f73937f33faac9a04641ab442')

prepare() {
	echo "VERSION = \"${pkgver}\"" > ${pkgname}-${pkgver}/cdist/version.py
}

build() {
	cd ${pkgname}-${pkgver}/

	python setup.py build
}

package() {
	cd ${pkgname}-${pkgver}/

	python setup.py install --root="${pkgdir}"
}

