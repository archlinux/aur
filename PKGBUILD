# Maintainer: Aleksandar Trifunovic akstrfn at gmail dot com
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-nevergrad
pkgver=0.1.6
pkgrel=1
pkgdesc='Gradient-free optimization'
arch=('any')
url='https://github.com/facebookresearch/nevergrad'
license=(MIT)
depends=('mypy' 'python-bayesian-optimization' 'python-cma' 'python-coverage'
         'python-genty' 'python-joblib' 'python-matplotlib' 'python-nose'
         'python-nose-timer' 'python-numpy' 'python-pandas'
         'python-typing-extensions')
makedepends=('git' 'python-setuptools' 'python-pytest')
source=("git+$url#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd nevergrad
  python setup.py build
}

# has to be disabled until
# https://github.com/facebookresearch/nevergrad/issues/72 is resolved
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
