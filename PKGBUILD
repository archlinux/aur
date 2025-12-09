# Maintainer: piernov <piernov@piernov.org>

pkgname=python-clearml
pkgver=2.1.0
pkgrel=1
pkgdesc="Auto-Magical Suite of tools to streamline your ML workflow"
arch=('any')
url="https://github.com/allegroai/clearml"
license=('MIT')
depends=('python' 'python-attrs' 'python-furl' 'python-jsonschema' 'python-numpy' 'python-pathlib2' 'python-pillow' 'python-pyparsing' 'python-dateutil' 'python-pyjwt' 'python-pyyaml' 'python-requests' 'python-six' 'python-urllib3')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("clearml-$pkgver.tar.gz::https://github.com/allegroai/clearml/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('f78a9cf7b6d23205927be890074992ef')

build() {
  cd "$srcdir"/clearml-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/clearml-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
