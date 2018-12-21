# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-bayesian-optimization
pkgver=1.0.0
pkgrel=1
pkgdesc='Bayesian global optimization with gaussian processes'
arch=(any)
url='https://github.com/fmfn/BayesianOptimization'
license=(MIT)
depends=(python-numpy python-scikit-learn python-scipy)
makedepends=(git python-setuptools)
source=("git+$url#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd BayesianOptimization

  python setup.py build
}

package() {
  cd BayesianOptimization

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
