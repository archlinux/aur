# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=python-smooth
pkgver=0.4.1.post1
pkgrel=1
pkgdesc="AI browser automation SDK and CLI - control browsers with natural language"
arch=('any')
url="https://github.com/circlemind-ai/smooth-sdk"
license=('custom:proprietary')
depends=('python' 'python-pydantic' 'python-aiohttp' 'python-aiohttp-retry' 'python-deprecated' 'python-nanoid')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
optdepends=('python-fastmcp: MCP server support')
source=("https://files.pythonhosted.org/packages/source/s/smooth-py/smooth_py-${pkgver}.tar.gz")
sha256sums=('389ee0e53f50544bfc3aee9fce5906466dfd9ff892f68ac9e03e2c4eca251d2f')

build() {
    cd "smooth_py-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "smooth_py-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
