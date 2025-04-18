# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname=python-doubleratchet
pkgver=1.1.0
pkgrel=1
pkgdesc="A python implementation of the Double Ratchet algorithm"
url='https://github.com/Syndace/python-doubleratchet'
license=('MIT')
arch=('any')
makedepends=(
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel'
)
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/Syndace/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('64052f440aaeb2053e4e72d8de5c99d3d3d699189f6213b21a2fddbf4045aa50')
depends=('python-cryptography')

build() {
	cd ${pkgname}-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd ${pkgname}-${pkgver}
	python -m installer --destdir="$pkgdir" dist/*.whl
}
