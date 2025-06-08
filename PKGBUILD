pkgname=python-pyorg
_name=${pkgname#python-}
pkgver=0.1.1
pkgrel=1
pkgdesc="Python library for working with Emacs org mode."
arch=("x86_64")
url="https://github.com/jlumpe/pyorg"
depends=(python)
makedepends=(python-setuptools python-{build,installer,wheel})
source=("https://github.com/jlumpe/pyorg/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e741a774073cac644a07861208a6287b1e5da7aa7dcba8e5348ee024e9bca225')

build() {
  cd ${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
