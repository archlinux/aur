# Maintainer: Zoddo <archlinux+aur@zoddo.fr>

pkgname=ofxstatement-paypal
pkgver=2.1.2
pkgrel=1
pkgdesc='A plugin for ofxstatement to convert CSV-formatted Paypal exports to OFX format.'
arch=('any')
url="https://pypi.org/project/ofxstatement-paypal/"
license=('Apache-2.0')
depends=(
	ofxstatement
	python-click
)
makedepends=(
	python-setuptools
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f535a8eb401abb01c1c0ebb6f44c5eba2fa2567df8bd6c65dab111daa061cc3f')

build() {
	cd ${pkgname}-${pkgver}
	python setup.py build
}

package() {
	cd ${pkgname}-${pkgver}
	python setup.py install --root="${pkgdir}" --optimize=1
}
