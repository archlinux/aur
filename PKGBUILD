# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-perplexityai
pkgver=0.40.0
pkgrel=1
pkgdesc="The official Python library for the Perplexity API"
arch=('any')
url="https://github.com/perplexityai/perplexity-py"
license=('Apache')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-fancy-pypi-readme' )
depends=('python-httpx' 'python-pydantic' 'python-typing_extensions' 'python-anyio' 'python-distro' 'python-sniffio' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/perplexityai/perplexityai-0.40.0.tar.gz")
sha256sums=('7f385a9d953bc4c810b7b6d3c781f2798ddb494f1214bf893ff4578381ebb113')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
