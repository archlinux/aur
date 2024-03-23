# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-pyssim
_name=${pkgname#python-}
pkgver=0.7
pkgrel=1
pkgdesc='Module for computing Structured Similarity Image Metric (SSIM) in Python'
arch=(any)
url='https://github.com/jterrace/pyssim'
license=(MIT)
depends=(python python-pillow python-scipy python-numpy)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('a506a363521a6f0d5651c9f02d26538b99fdb3791a881488f23f4d65f704d5bc985129a80db1e3ec4eeca6059cfa621bc39a95fd1eabe57719b9f24279c6448d')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
