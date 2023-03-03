_name=aapt2
pkgname=python-aapt2
pkgver=0.2.1
pkgrel=1
pkgdesc="Android Asset Packaging Tool 2 for Python3"
arch=('any')
url="https://github.com/trevorwang/aapt"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c82396f3d71abf32b6a4f8f6b894766cec102f99c6ebb85cd0d2d9ba678d91ed')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
