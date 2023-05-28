# Maintainer: Paul Irofti <paul@irofti.net>
_name=tsnet
pkgname="python-$_name"
pkgver=0.2.4
pkgrel=1

pkgdesc="transient simulation in water networks using Method of Characteristics"
url="https://github.com/glorialulu/TSNet"
arch=('any')
license=('MIT')

depends=(python python-numpy python-scipy python-networkx python-pandas
  python-matplotlib python-plotly python-wntr)
makedepends=(python-setuptools python-pytest-runner)

source=("https://files.pythonhosted.org/packages/source/t/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b53785741776818f0ce7c206607251bb68a93ba07b5f3cb5132739ad4a93dc22')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
