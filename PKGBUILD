# Contributor: tembleking <tembleking at gmail dot com>
pkgname=python-jsondatabase
pkgver=0.1.7
pkgrel=1
pkgdesc="A flat file database for json objects"
arch=("any")
url="https://github.com/gunthercox/jsondb"
license=('custom:BSD-3-clause')
depends=(python)
makedepends=(python-setuptools)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('37e207efc24aef87f086bd1f154059295234deeb2820a50b08e00afcd41c0066d1e0ffac21fc671bd41eee7a7fd342d20abc5c6c0e2131a647ad65c8d9121ac1')

package() {
	cd jsondb-${pkgver}
	export PYTHONHASHSEED=0
	PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
