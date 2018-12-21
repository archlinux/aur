# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-cma
pkgver=2.6.0
pkgrel=1
pkgdesc='Implementation of CMA-ES'
arch=(any)
url='https://github.com/CMA-ES/pycma'
license=(MIT)
depends=(python-numpy)
makedepends=(git python-setuptools)
source=("git+$url#tag=r$pkgver")
md5sums=('SKIP')

build() {
  cd pycma

  python setup.py build
}

package() {
  cd pycma

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
