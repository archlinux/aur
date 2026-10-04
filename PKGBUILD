# Maintainer: Frestein <fresteinart@gmail.com>

pkgname=rassumfrassum
pkgver=0.3.5
pkgrel=1
pkgdesc="LSP/JSONRPC multiplexer for connecting one LSP client to multiple servers"
arch=('any')
url="https://github.com/joaotavora/rassumfrassum"
license=('GPL3')
depends=('python>=3.10')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'git')
source=("${pkgname}-${pkgver}::git+https://github.com/joaotavora/rassumfrassum.git#tag=v${pkgver}")
sha256sums=('245be3632b6175eda1dec95beae215f837e2b560d024db30be4d78b11a593cdf')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
