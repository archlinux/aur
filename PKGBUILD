# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

pkgname=python-click-prompt
pkgver=0.6.2
pkgrel=1
pkgdesc="Interactive command line options for the click library "
arch=('any')
url="https://github.com/markusgrotz/click-prompt"
license=(MIT)
groups=()
# Normally validators 0.22 is required, but Arch only provides 0.20.2 (flagged a few months ago)
depends=('python>=3.6.9' 'python-click>=8.0.4' 'python-click<9.0' 'python-questionary>=1.10.0')
makedepends=(python-build python-installer python-wheel 'python-poetry-core>=1.0.0' python-poetry-plugin-export 'python-platformdirs<5.0' 'python-platformdirs>=3.9.1')
optdepends=()
source=("click_prompt.tar.gz::https://files.pythonhosted.org/packages/58/74/6d36d397eae4c7d5418003ef66cb13837fdf4729876f6ea5b78dc31ebca0/click_prompt-${pkgver}.tar.gz")
sha256sums=('85e23eb4d6c6eec9b2e90a28b037453f56d656100451c027c242fc54554bfb7d')

build() {
	cd "click_prompt-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "click_prompt-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
