# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=discover
pkgbase=python-$_pyname
pkgname=(python-$_pyname)
pkgver=0.4.0
pkgrel=1
pkgdesc="Test discovery for unittest."
arch=(any)
url="http://pypi.python.org/pypi/discover/"
license=(BSD)
depends=(python)
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)

build() {
  cd "$_pyname-$pkgver"
  python -m build --wheel --no-isolation
}
package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
sha256sums=('05c3fa9199e57d4b16fb653e02d65713adc1f89ef55324fb0c252b1cf9070d79')
