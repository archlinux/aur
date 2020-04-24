# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-cma
pkgver=3.0.3
pkgrel=1
pkgdesc='The Covariance Matrix Adaptation Evolution Strategy'
arch=(any)
url='https://github.com/CMA-ES/pycma'
license=('MIT')
depends=(python-numpy)
makedepends=(git python-setuptools)
source=("git+$url#tag=r$pkgver")
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
