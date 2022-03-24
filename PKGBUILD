# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
pkgname=python-meshio
pkgver=5.3.4
pkgrel=1
pkgdesc='Input/output for many mesh formats'
url='https://github.com/nschloe/meshio'
arch=('x86_64')
license=('MIT')
depends=('python-numpy' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('python-netcdf4' 'python-h5py')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('710af6e4fa2daed144f7fd58690fa6cbd476956d02b453ecae45787eb0bef3e3')

build() {
  cd "meshio-$pkgver"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "meshio-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

