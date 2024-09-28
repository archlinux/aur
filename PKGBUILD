# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

pkgname=python-click-prompt
pkgver=0.6.1
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
source=("click_prompt.tar.gz::https://github.com/markusgrotz/click-prompt/releases/download/v${pkgver}/click_prompt-${pkgver}.tar.gz")
sha256sums=('c158c6227a30a803970d08cfcb2b83bcdbc1729bf0189c03981a2db28ac1ef04')

build() {
	cd "click_prompt-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "click_prompt-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
