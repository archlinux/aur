# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=python-smooth
pkgver=0.4.5
pkgrel=1
pkgdesc="AI browser automation SDK and CLI - control browsers with natural language"
arch=('any')
url="https://github.com/circlemind-ai/smooth-sdk"
license=('custom:proprietary')
depends=('python' 'python-pydantic' 'python-aiohttp' 'python-aiohttp-retry' 'python-deprecated' 'python-nanoid')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
optdepends=('python-fastmcp: MCP server support')
source=("https://files.pythonhosted.org/packages/source/s/smooth-py/smooth_py-${pkgver}.tar.gz")
sha256sums=('39e9d47282fa5e28f50c583223b906a0baaa4a7f2395afda85210fef831ad7ec')

build() {
    cd "smooth-py-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "smooth-py-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
