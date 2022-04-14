# Contributor: Patrick Mischke

pkgname='python-pygad'
_name='pygad'
pkgver=2.16.3
pkgrel=2
pkgdesc="A Python 3 Library for Building the Genetic Algorithm and Training Machine Learning Algoithms"
url="https://github.com/ahmedfgad/GeneticAlgorithmPython"
depends=('python-numpy' 'python-matplotlib')
makedepends=()
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('db8322bcdfc41f3553f77f1ac099d07f7a89f31bf87c0f23bd5fb4a5b7c1bbf4')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
