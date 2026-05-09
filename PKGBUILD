# Maintainer: Frestein <fresteinart@gmail.com>

pkgname=rassumfrassum
pkgver=0.3.3
pkgrel=1
pkgdesc="LSP/JSONRPC multiplexer for connecting one LSP client to multiple servers"
arch=('any')
url="https://github.com/joaotavora/rassumfrassum"
license=('GPL3')
depends=('python>=3.10')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'git')
source=("${pkgname}-${pkgver}::git+https://github.com/joaotavora/rassumfrassum.git#tag=v${pkgver}")
sha256sums=('5fb2f7973a218ad32e974000881cbfaccc61a0dc9fa9c5be3dc52281488cbbd0')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
