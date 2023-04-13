# Maintainer: Bao Trinh <qubidt@gmail.com>

pkgname=python-cohost
pkgver=0.2.5
_commit=f0d0c7838301bd03823196c3ba2d2dee726ed2d5
pkgrel=1
pkgdesc="A python library for Cohost.org!"
arch=('any')
url="https://github.com/valknight/Cohost.py"
license=('BSD')
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
