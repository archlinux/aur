# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
_name=kitcat
pkgname=python-$_name
pkgver=2.0.2
pkgrel=1
pkgdesc="Matplotlib backend for direct plotting in the terminal using Kitty graphics protocol"
arch=(any)
url=https://github.com/mil-ad/kitcat
license=(MIT)
depends=(python-matplotlib)
makedepends=(python-hatchling python-build python-installer python-wheel)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('21a09d2ec322f46019d7a4a3fea64fba816bf631250e013f50944a1c42e09c0c')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
