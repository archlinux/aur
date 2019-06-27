# Maintainer: piernov <piernov@piernov.org>

pkgname=python-neupy
pkgver=0.8.2
pkgrel=1
pkgdesc="A Tensorflow based python library for prototyping and building neural networks"
arch=('any')
url="http://neupy.com/"
license=('MIT')
depends=('python-numpy' 'python-matplotlib' 'python-tensorflow' 'python-scipy' 'python-progressbar' 'python-graphviz')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::"https://github.com/itdxer/neupy/archive/v$pkgver.tar.gz")
sha512sums=('a120b21b49cd7ce97d79fae6f0e7fe83b8760e18cfffa0adcfc1d89440bffee1eb85bdac6c21f4c17528a65954ac0ccc21fc1e42e1a45c38b27620f237358392')

build() {
  cd neupy-$pkgver
  python setup.py build
}

package() {
  cd neupy-$pkgver
  python setup.py install --root "$pkgdir" --prefix=/usr --optimize=1 --skip-build
}
