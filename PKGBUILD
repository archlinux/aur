# Contributor: Patrick Mischke

pkgname='python-pygad'
_name='pygad'
pkgver=2.18.0
pkgrel=1
pkgdesc="A Python 3 Library for Building the Genetic Algorithm and Training Machine Learning Algoithms"
url="https://github.com/ahmedfgad/GeneticAlgorithmPython"
depends=('python-numpy' 'python-matplotlib')
makedepends=()
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('16168d4eb3294758e8de97730de55ccf42c5ab8c456810c26fe800bf7fc49409')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
