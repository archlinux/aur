# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Alexander F. Rødseth <xyproto at archlinux dot org>

pkgname=python-cma
pkgver=3.3.0
pkgrel=1
pkgdesc='The Covariance Matrix Adaptation Evolution Strategy'
arch=(any)
url='https://github.com/CMA-ES/pycma'
license=('MIT')
depends=(python-numpy)
makedepends=(git python-setuptools)
_commit=41ce61793c37ac9c5667f104c818407e952663b0
source=("git+$url#commit=$_commit")
sha256sums=('SKIP')

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
