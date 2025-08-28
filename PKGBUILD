# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-helpscout-v2
_reponame=python-helpscout
pkgver=2.0.1
pkgrel=2
pkgdesc="Client for interacting with Help Scout's API"
url="https://pypi.org/project/${_reponame}/"
arch=('any')
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame//-/_}-${pkgver}.tar.gz")
sha256sums=('8f2f7a08f26d4d350168f1a1b7f2d44e2fd9ac6e926f97382db2a7f58e9dd2e1')

build() {
	cd "${srcdir}/${_reponame//-/_}-${pkgver}"
	python -m build
}

package() {
	cd "${srcdir}/${_reponame//-/_}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
