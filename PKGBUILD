pkgname=budget-planner
pkgver=0.1.1
pkgrel=1
pkgdesc="CLI budget planner that projects your bank balance from YAML config"
arch=('any')
url="https://github.com/salehjg/BudgetPlanner"
license=('MIT')
depends=('python' 'python-pyyaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/salehjg/BudgetPlanner/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a58bd9f8aa2528669d1254aa0654fc5070cf816c974ebfaba6a71299822dd97d')

build() {
  cd "BudgetPlanner-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "BudgetPlanner-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
