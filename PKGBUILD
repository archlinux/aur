# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-perplexityai
pkgver=0.41.0
pkgrel=1
pkgdesc="The official Python library for the Perplexity API"
arch=('any')
url="https://github.com/perplexityai/perplexity-py"
license=('Apache')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-fancy-pypi-readme' )
depends=('python-httpx' 'python-pydantic' 'python-typing_extensions' 'python-anyio' 'python-distro' 'python-sniffio' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/perplexityai/perplexityai-0.41.0.tar.gz")
sha256sums=('cba175b8ec9a8f006d19aec1a1e991c1b972f9bea4ae24373671c35721732f3c')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
