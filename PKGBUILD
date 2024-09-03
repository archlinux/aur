# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Alexander F. Rødseth <xyproto at archlinux dot org>

pkgname=python-cma
pkgver=4.0.0
pkgrel=1
pkgdesc='The Covariance Matrix Adaptation Evolution Strategy'
arch=(any)
url='https://github.com/CMA-ES/pycma'
license=('MIT')
depends=(python-numpy)
makedepends=(git python-setuptools)
_commit=0086ab4cf70db09917bf4c435258c2aaba769a1f
source=("git+$url#commit=$_commit")
sha256sums=('57063cb86d42cbaf662489b1c58d045019752c2cfcac051d24ce4bdb1ef7f67f')

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
