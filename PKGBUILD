# Maintainer: Behnam Lal <dev at behnamlal dot xyz>
# Contributor: Patrick Mischke

pkgname='python-pygad'
_name='pygad'
pkgver=3.3.1
pkgrel=2
pkgdesc="A Python 3 Library for Building the Genetic Algorithm and Training Machine Learning Algorithms"
url="https://github.com/ahmedfgad/GeneticAlgorithmPython"
depends=('python-numpy' 'python-matplotlib' 'python-cloudpickle')
makedepends=()
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4291c4e23912684653ed38331f86bd4611715d6068cfaa3363d9039f2fb79259')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
