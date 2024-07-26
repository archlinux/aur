# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
pkgname=python-meshio
pkgver=5.3.5
pkgrel=1
pkgdesc='Input/output for many mesh formats'
url='https://github.com/nschloe/meshio'
arch=('x86_64')
license=('MIT')
depends=('python-numpy' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-netcdf4' 'python-h5py')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9e05d217857138d8f731803366c67acea2cfd67b0dd5aebe0281f1fb13ba57e5')

build() {
  cd "meshio-$pkgver"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "meshio-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

