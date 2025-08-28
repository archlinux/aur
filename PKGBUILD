# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-stagger
pkgver=1.0.1
pkgrel=8
pkgdesc="ID3v1/ID3v2 tag manipulation package in pure Python 3"
arch=('any')
url="https://github.com/lorentey/stagger"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lorentey/stagger/archive/release-${pkgver}.tar.gz")
sha512sums=('9f47f95d2d8473b89725c1568067a1462ca20bf424b08f226092bae6ea3df2c62eb7f0dda84e692f2b9b8526a8649ce42aa5ac7a152ccf813f8d7ccca6cd7598')

build() {
	cd ${srcdir}/stagger-release-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd ${srcdir}/stagger-release-${pkgver}
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
