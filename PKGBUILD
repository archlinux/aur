# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-perplexityai
pkgver=0.39.0
pkgrel=1
pkgdesc="The official Python library for the Perplexity API"
arch=('any')
url="https://github.com/perplexityai/perplexity-py"
license=('Apache')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-fancy-pypi-readme' )
depends=('python-httpx' 'python-pydantic' 'python-typing_extensions' 'python-anyio' 'python-distro' 'python-sniffio' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/perplexityai/perplexityai-0.39.0.tar.gz")
sha256sums=('7cf965ddac7a570a157e102ff2146306d13f771c4205b2e16f9c051aca2e2616')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
