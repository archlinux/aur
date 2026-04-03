pkgname=budget-planner
pkgver=0.1.2
pkgrel=1
pkgdesc="CLI budget planner that projects your bank balance from YAML config"
arch=('any')
url="https://github.com/salehjg/BudgetPlanner"
license=('MIT')
depends=('python' 'python-pyyaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/salehjg/BudgetPlanner/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7364d617754b3ccd901257678523f68796a914d778ee5b952d95092f65e0bdec')

build() {
  cd "BudgetPlanner-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "BudgetPlanner-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
