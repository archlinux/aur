# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=cdist
pkgver=4.7.1
pkgrel=1
pkgdesc='A usable configuration management system'
arch=('any')
url='https://github.com/ungleich/cdist'
license=('GPL3')
depends=('python' 'openssh')
makedepends=('python-setuptools')
validpgpkeys=('69767822F3ECC3C349C1EFFFEFD2AE4EC36B6901') # ungleich GmbH (ungleich FOSS) <foss@ungleich.ch>')
source=("https://github.com/ungleich/cdist/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('6c1bf094f08e89ab103f7b07474728bf9de063ae39184e1c5d9015eaff8a4cd2'
            'SKIP')

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

