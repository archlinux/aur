# Maintainer: Winux <winux@winux.it>
pkgname=python-rembg
_pkgname=rembg
pkgver=2.0.72
pkgrel=1
pkgdesc="Rembg is a tool to remove images background"
arch=('any')
url="https://github.com/danielgatis/rembg"
license=('MIT')
depends=('python' 'python-jsonschema' 'python-numpy' 'python-onnxruntime' 'python-opencv' 'python-pillow' 'python-pooch' 'python-pymatting' 'python-scikit-image' 'python-scipy' 'python-tqdm' 'python-aiohttp' 'python-click' 'python-fastapi' 'python-filetype' 'python-gradio' 'python-python-multipart' 'uvicorn' 'python-watchdog' 'python-asyncer')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-twine')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/danielgatis/rembg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8BB1C01A7EAC3BA3DF0F3C7D3729D63AFB1DFE33E0151DE65AD2C157DBA1AC3B')
build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
