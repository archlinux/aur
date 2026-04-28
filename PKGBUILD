# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=python-smooth
pkgver=0.4.4
pkgrel=1
pkgdesc="AI browser automation SDK and CLI - control browsers with natural language"
arch=('any')
url="https://github.com/circlemind-ai/smooth-sdk"
license=('custom:proprietary')
depends=('python' 'python-pydantic' 'python-aiohttp' 'python-aiohttp-retry' 'python-deprecated' 'python-nanoid')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
optdepends=('python-fastmcp: MCP server support')
source=("https://files.pythonhosted.org/packages/source/s/smooth-py/smooth_py-${pkgver}.tar.gz")
sha256sums=('688175ed80a4a74d81c8ae42e15530500264b9c1995a6b5aa40f12ab9c64d73a')

build() {
    cd "smooth-py-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "smooth-py-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
