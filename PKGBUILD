pkgname=python2-deap
pkgver=1.0.2
pkgrel=1
pkgdesc="Distributed Evolutionary Algorithms in Python"
arch=('any')
url="https://github.com/DEAP/deap"
license=('LGPL')
depends=('python2' 'python2-pysqlite')
optdepends=("python2-numpy: for CMA-ES" "python2-matplotlib: for visualization" "python2-scoop: for computation distribution")
source=("https://pypi.python.org/packages/source/d/deap/deap-$pkgver.post2.tar.gz")
md5sums=('ccf5ed7562e4d6236c9416e3b5a9d941')

package() {
  cd "$srcdir/deap-$pkgver"
  find . -name '*.py' -exec sed -i -e '1 s/python\s*$/python2/' {} \;
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
