# Maintainer: piernov <piernov@piernov.org>

pkgname=python-icedata
pkgver=0.5.2
pkgrel=1
pkgdesc="Datasets Hub for the IceVision Framework"
arch=('any')
url="https://github.com/airctic/icedata"
license=('APACHE')
depends=('python-icevision' 'python-fire')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("git+https://github.com/airctic/icedata.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir"/icedata
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/icedata
  python -m installer --destdir="$pkgdir" dist/*.whl
}
