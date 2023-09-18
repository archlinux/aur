# Maintainer: Bao Trinh <qubidt@gmail.com>

pkgname=python-cohost
pkgver=0.3.3
_commit=5e780db53e94e0b6839e37cd5fcfb0d65ebee17d
pkgrel=1
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
