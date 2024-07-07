# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Alexander F. Rødseth <xyproto at archlinux dot org>

pkgname=python-cma
pkgver=3.4.0
pkgrel=1
pkgdesc='The Covariance Matrix Adaptation Evolution Strategy'
arch=(any)
url='https://github.com/CMA-ES/pycma'
license=('MIT')
depends=(python-numpy)
makedepends=(git python-setuptools)
_commit=16c949f8415e711c374329e16409f1b56c1276aa
source=("git+$url#commit=$_commit")
sha256sums=('b3b581ce4e7c6e01501f94524a7eba95f4d6a17ba6fe14bc8e6d83948af5f7ab')

build() {
  cd ${srcdir}/pycma

  python setup.py build
}

package() {
  cd ${srcdir}/pycma

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
