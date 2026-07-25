# Maintainer: reelwiselab <wartzarworld+aur@gmail.com>
pkgname=python-tokenscope
_name=tokenscope
pkgver=0.2.0
pkgrel=1
pkgdesc="Token-Aware Directory Explorer for LLMs (MCP server): report how many tokens a directory tree costs"
arch=('any')
url="https://github.com/cdgaete/token-scope-mcp"
license=('MIT')
depends=('python' 'python-tiktoken')
optdepends=('python-fastmcp: run as an MCP server')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/t/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8cedf7586521b9545b26041bbb7b14ffaf83825821dec8ecf5a943cf1ad7310d')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
