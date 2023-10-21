# Maintainer: jhossbach <julian dot hossbach at gmx dot de>

pkgname=jupyterlab-catppuccin
pkgver=0.2.0
pkgrel=1
pkgdesc='Catppuccin theme for jupyterlab.'
arch=(any)
url="https://github.com/catppuccin/jupyterlab"
license=(MIT)
depends=(python jupyterlab)
makedepends=(python-build python-installer python-hatchling python-hatch-jupyter-builder python-hatch-nodejs-version python-rfc3986-validator)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/catppuccin/jupyterlab/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('323a67cda29b56489b27313f95bcfa663eb0a5aea8809678e8638acf81f6a6b2')

build() {
    cd "jupyterlab-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
  cd "jupyterlab-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
