# Maintainer: Eldred Habert <me@eldred.fr>
pkgname=python-click-params
pkgver=0.5.0
pkgrel=4
pkgdesc="A bunch of useful click parameter types"
arch=('any')
url="https://click-params.readthedocs.io/en/stable"
license=(Apache-2.0)
groups=()
# Normally validators 0.22 is required, but Arch only provides 0.20.2 (flagged a few months ago)
depends=('python>=3.8' 'python-click>=7.0' 'python-click<9.0' 'python-validators>=0.20' 'python-deprecated>=1.2.14' 'python-deprecated<2')
makedepends=(python-build python-installer python-wheel 'python-poetry-core>=1.0.0' python-poetry-plugin-export 'python-platformdirs<5.0' 'python-platformdirs>=3.9.1')
optdepends=()
source=("click_params.tar.gz::https://github.com/click-contrib/click_params/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('72cde26bf956fbed43ccfced780a7f10d62f940c17297fa777f9e4a122cb7627')

build() {
	cd "click_params-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "click_params-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
