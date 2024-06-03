# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname=python-doubleratchet
pkgver=1.0.3
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
sha256sums=('a254ace2b972d8adde25d7ba620e40249e47eb2ec4b5cb9a2657e0d565e024b0')
depends=('python-cryptography')

build() {
	cd ${pkgname}-${pkgver}
	python -m build --wheel --no-isolation
}

package() {
	cd ${pkgname}-${pkgver}
	python -m installer --destdir="$pkgdir" dist/*.whl
}
