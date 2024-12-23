# Maintainer: Zoddo <archlinux+aur@zoddo.fr>

pkgname=ofxstatement-revolut
pkgver=2.0.4
pkgrel=2
pkgdesc='A plugin for ofxstatement to convert CSV-formatted Revolut exports to OFX format.'
arch=('any')
url="https://github.com/mlaitinen/ofxstatement-revolut"
license=('GPL-3.0-or-later')
depends=(
	ofxstatement
)
makedepends=(
	python-setuptools
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0216c8cfaffa382767d223a158842801fad6964d83584b90791112d5a31c497e')

build() {
	cd ${pkgname}-${pkgver}
	python setup.py build
}

package() {
	cd ${pkgname}-${pkgver}
	python setup.py install --root="${pkgdir}" --optimize=1
}
