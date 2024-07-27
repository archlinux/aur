# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname=python-doubleratchet
pkgver=1.0.4
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
sha256sums=('7a74ad789e053ac1259a53b16868a54aafbcefda984a383f88525b767536a941')
depends=('python-cryptography')

build() {
	cd ${pkgname}-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd ${pkgname}-${pkgver}
	python -m installer --destdir="$pkgdir" dist/*.whl
}
