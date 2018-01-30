# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=cdist
pkgver=4.7.3
pkgrel=1
pkgdesc='A usable configuration management system'
arch=('any')
url='https://github.com/ungleich/cdist'
license=('GPL3')
depends=('python' 'openssh')
makedepends=('python-setuptools')
validpgpkeys=('69767822F3ECC3C349C1EFFFEFD2AE4EC36B6901') # ungleich GmbH (ungleich FOSS) <foss@ungleich.ch>')
source=("https://github.com/ungleich/cdist/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('ab80460ce5383d34b904cb8b5ad4367def76025ebf9534e67ab80f29ea44c8c8'
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

