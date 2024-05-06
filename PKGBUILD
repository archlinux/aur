# Maintainer: Dringsim <dringsim@qq.com>
# Contributor: PumpkinCheshire <sollyonzou@gmail.com>

_name=geomet
pkgname=python-geomet
pkgver=1.1.0
pkgrel=1
pkgdesc="GeoMet - Convert GeoJSON to WKT/WKB, and vice versa."
arch=('any')
url="https://github.com/geomet/geomet"
license=('Apache-2.0')
depends=('python-click')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('51e92231a0ef6aaa63ac20c443377ba78a303fd2ecd179dc3567de79f3c11605')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  #install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
