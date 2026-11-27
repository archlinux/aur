# Maintainer: Frestein <fresteinart@gmail.com>

pkgname=rassumfrassum-git
pkgver=0.3.3.r8.g7ab6bf4
pkgrel=2
pkgdesc="LSP/JSONRPC multiplexer for connecting one LSP client to multiple servers"
arch=('any')
url="https://github.com/joaotavora/rassumfrassum"
license=('GPL3')
depends=('python>=3.10')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'git')
provides=('rassumfrassum')
conflicts=('rassumfrassum')
source=("${pkgname}::git+https://github.com/joaotavora/rassumfrassum.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
