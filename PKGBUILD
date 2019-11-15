# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=cdist
pkgver=4.11.1
pkgrel=1
pkgdesc='A usable configuration management system'
arch=('any')
url='https://github.com/ungleich/cdist'
license=('GPL3')
depends=('python' 'openssh')
makedepends=('python-setuptools')
validpgpkeys=('69767822F3ECC3C349C1EFFFEFD2AE4EC36B6901') # ungleich GmbH (ungleich FOSS) <foss@ungleich.ch>')
source=("https://github.com/ungleich/cdist/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('cc35bd05bf4feed44f9ac33b1a868a27029abfd05018cee2f053f54c318186a6'
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

