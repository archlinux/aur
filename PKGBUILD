# Maintainer: Paul Irofti <paul@irofti.net>
_name=tsnet
pkgname="python-$_name"
pkgver=0.2.2
pkgrel=1

pkgdesc="transient simulation in water networks using Method of Characteristics"
url="https://github.com/glorialulu/TSNet"
arch=('any')
license=('MIT')

depends=(python python-numpy python-scipy python-networkx python-pandas
  python-matplotlib python-plotly python-wntr)
makedepends=(python-setuptools python-pytest-runner)

source=("https://files.pythonhosted.org/packages/source/t/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('363fc2cd3ac2529d0fedf24b272b394fb2292116984b3b27c9deb1dbe1d16670')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
