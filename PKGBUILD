# Maintainer: Frestein <fresteinart@gmail.com>

pkgname=rassumfrassum
pkgver=0.3.4
pkgrel=1
pkgdesc="LSP/JSONRPC multiplexer for connecting one LSP client to multiple servers"
arch=('any')
url="https://github.com/joaotavora/rassumfrassum"
license=('GPL3')
depends=('python>=3.10')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'git')
source=("${pkgname}-${pkgver}::git+https://github.com/joaotavora/rassumfrassum.git#tag=v${pkgver}")
sha256sums=('8991ceecb44b5b46727e5d72d8183df9f93057ac4af4f15b1dae05236c57c5d6')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
