# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pyname=click-prompt
pkgname=python-${_pyname}
pkgver=0.6.4
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
source=("https://files.pythonhosted.org/packages/84/62/a89437343bd8387cc1cca2b9b116bebe17a2a79b6fd19fe33b378f3069fd/${_pyname//-/_}-${pkgver}.tar.gz")
sha256sums=('b914a4afb37e1172d75989738d42a701dd43cd354a2981e11ee7ec17f8baa821')

build() {
	cd "click_prompt-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "click_prompt-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
