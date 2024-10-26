# Maintainer: Aleksandar Trifunovic akstrfn at gmail dot com
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-bayesian-optimization
pkgver=2.0.0
pkgrel=1
pkgdesc='Bayesian global optimization with gaussian processes'
arch=(any)
url='https://github.com/fmfn/BayesianOptimization'
license=(MIT)
depends=(python-numpy python-scikit-learn python-scipy)
makedepends=(git python-poetry)
source=("git+$url#tag=v$pkgver")
md5sums=('938ce4a0c06517c5e946e87ebe1e4abb')

build() {
  cd BayesianOptimization
  python -m build --wheel --no-isolation
}

package() {
  cd BayesianOptimization

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
