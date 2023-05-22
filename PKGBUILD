# Maintainer: piernov <piernov@piernov.org>

pkgname=python-clearml
pkgver=1.10.4
pkgrel=1
pkgdesc="Auto-Magical Suite of tools to streamline your ML workflow"
arch=('any')
url="https://github.com/allegroai/clearml"
license=('MIT')
depends=('python' 'python-attrs' 'python-furl' 'python-jsonschema' 'python-numpy' 'python-pathlib2' 'python-pillow' 'python-pyparsing' 'python-dateutil' 'python-pyjwt' 'python-pyyaml' 'python-requests' 'python-six' 'python-urllib3')
makedepends=('python-setuptools')
source=("clearml-$pkgver.tar.gz::https://github.com/allegroai/clearml/archive/refs/tags/v$pkgver-fix.tar.gz")
md5sums=('74c331a7dbf734b0da00363a0954b398')

build() {
  cd "$srcdir"/clearml-$pkgver-fix
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/clearml-$pkgver-fix
  python -m installer --destdir="$pkgdir" dist/*.whl
}
