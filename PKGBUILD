# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-nevergrad
pkgver=0.1.0
pkgrel=3
pkgdesc='Gradient-free optimization'
arch=(any)
url='https://github.com/facebookresearch/nevergrad'
license=(MIT)
depends=(mypy python-bayesian-optimization python-cma python-coverage python-genty python-joblib python-matplotlib python-nose python-nose-timer python-numpy python-pandas)
makedepends=(git python-setuptools)
source=("git+$url#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd nevergrad

  python setup.py build
}

package() {
  cd nevergrad

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
