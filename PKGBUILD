pkgname=python2-deap
pkgver=1.2.2
pkgrel=1
pkgdesc="Distributed Evolutionary Algorithms in Python"
arch=('any')
url="https://github.com/DEAP/deap"
license=('LGPL')
depends=('python2' 'python2-pysqlite')
optdepends=("python2-numpy: for CMA-ES" "python2-matplotlib: for visualization" "python2-scoop: for computation distribution")
source=("https://github.com/DEAP/deap/archive/$pkgver.tar.gz")
md5sums=('49a80a4033a6869a15cca24ea4982910')

package() {
  cd "deap-$pkgver"
  find . -name '*.py' -exec sed -i -e '1 s/python\s*$/python2/' {} \;
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
