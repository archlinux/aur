# Maintainer: Bao Trinh <qubidt@gmail.com>

pkgname=python-cohost
pkgver=0.2.6
_commit=fde22cb9ead68aec770c79c86a9cca1d0563ad0f
pkgrel=2
pkgdesc="A python library for Cohost.org!"
arch=('any')
url="https://github.com/valknight/Cohost.py"
license=('MIT')
depends=('python>3.6' 'python-requests')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=()
source=("${pkgname}::git+${url}.git#commit=${_commit}")
noextract=()
sha256sums=('SKIP')

build() {
	cd "${pkgname}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
