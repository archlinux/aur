# Maintainer: Aleksandar Trifunovic akstrfn at gmail dot com
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-nevergrad
pkgver=0.4.2
pkgrel=1
pkgdesc='Gradient-free optimization'
arch=('any')
url='https://github.com/facebookresearch/nevergrad'
license=(MIT)
depends=('mypy' 'python-bayesian-optimization' 'python-cma' 'python-coverage'
         'python-genty' 'python-joblib' 'python-matplotlib' 'python-nose'
         'python-nose-timer' 'python-numpy' 'python-pandas'
         'python-typing-extensions' 'python-pyproj')
makedepends=('git' 'python-setuptools' 'python-pytest' 'python-gym')
source=("git+$url#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd nevergrad
  python setup.py build
}

# tests require some packages that are not in the aur such as fcmaes and maybe
# some others
#check() {
#  cd nevergrad
#  pytest
#}

package() {
  cd nevergrad
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
