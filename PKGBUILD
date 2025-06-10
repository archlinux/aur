# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pyname=click-prompt
pkgname=python-${_pyname}
pkgver=0.6.5
pkgrel=1
pkgdesc="Interactive command line options for the click library "
arch=('any')
url="https://github.com/markusgrotz/${_pyname}"
license=(MIT)
groups=()
# Normally validators 0.22 is required, but Arch only provides 0.20.2 (flagged a few months ago)
depends=('python>=3.6.9' 'python-click>=8.0.4' 'python-click<9.0' 'python-questionary>=1.10.0')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core>=1.0.0' 'python-poetry-plugin-export' 'python-platformdirs<5.0' 'python-platformdirs>=3.9.1')
optdepends=()
source=("https://files.pythonhosted.org/packages/34/17/addbe2d5058d3368f48679d757e32954dfd831b8c46c423ac88e7dfabf5a/${_pyname//-/_}-${pkgver}.tar.gz")
sha256sums=('eb493274fe4415ddd2ec9f6dc2706fa9dc16b72e6982d1f621b1e370e3d46345')

build() {
	cd "click_prompt-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "click_prompt-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
