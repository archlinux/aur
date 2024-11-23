# Maintainer: Winux <winux@winux.it>
pkgname=python-rembg
_pkgname=rembg
pkgver=2.0.60
pkgrel=1
pkgdesc="Rembg is a tool to remove images background"
arch=('any')
url="https://github.com/danielgatis/rembg"
license=('MIT')
depends=('python' 'python-jsonschema' 'python-numpy1' 'python-onnxruntime' 'python-opencv' 'python-pillow' 'python-pooch' 'python-pymatting' 'python-scikit-image' 'python-scipy' 'python-tqdm' 'python-aiohttp' 'python-click' 'python-fastapi' 'python-filetype' 'python-gradio' 'python-python-multipart' 'uvicorn' 'python-watchdog' 'python-asyncer')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-twine')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/danielgatis/rembg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('01cc5736e8183a2fa097ca546e37f9b5a1e2962fd6d3c7b959d04b416f48a12b')
build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
