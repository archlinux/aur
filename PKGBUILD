# Maintainer: pappy <pa314159@users.noreply.github.com>
py_name=flask-assets
pkgname=python-$py_name
pkgver=2.1.0
pkgrel=1
pkgdesc="Asset management for Flask, to compress and merge CSS and Javascript files"
arch=(any)
url="https://flask-assets.readthedocs.io"
license=('BSD')
depends=(python python-flask python-webassets)
makedepends=(python-build python-installer python-wheel)
source=("https://github.com/miracle2k/$py_name/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e6903374cda21d667448233251ec046201e5bc1aa8b26b725e99a633d1f80183')

build() {
    cd "$srcdir/$py_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$py_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

