# Maintainer: Zoddo <archlinux+aur@zoddo.fr>

pkgname=ofxstatement-paypal
pkgver=2.1.2
pkgrel=2
pkgdesc='A plugin for ofxstatement to convert CSV-formatted Paypal exports to OFX format.'
arch=('any')
url="https://github.com/EtsBiz4Africa/ofxstatement-paypal"
license=('Apache-2.0')
depends=(
	ofxstatement
	python-click
)
makedepends=(
	python-setuptools
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ebb7a5fa63e4d4ef990c3a2a42790481b01495b63ed198711a48e5476e685809')

build() {
	cd ${pkgname}-${pkgver}
	python setup.py build
}

package() {
	cd ${pkgname}-${pkgver}
	python setup.py install --root="${pkgdir}" --optimize=1
}
