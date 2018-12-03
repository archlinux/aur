# Maintainer: Shi Liang <shilianggoo@gmail.com>

pkgname=python-deap-git
pkgver=1.2.2.r1972.82f774d
pkgrel=1
pkgdesc="Distributed Evolutionary Algorithms in Python (GIT-version)"
arch=('any')
url="https://github.com/DEAP/deap"
license=('LGPL')
depends=('python')
makedepends=('git')
conflicts=('python-deap')
provide=('python-deap')
source=("$pkgname::git+https://github.com/DEAP/deap.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  tag=$(git describe --tags $(git rev-list --tags --max-count=1))
  printf "%s.r%s.%s" $tag "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
