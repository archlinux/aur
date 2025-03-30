# Maintainer: fanyujun <dlutfyj@outlook.com>
# Contributor:

pkgname="python-deap"
pkgver=1.4.1
pkgrel=8
pkgdesc='DEAP is a novel evolutionary computation framework for rapid prototyping and testing of ideas.'
arch=(any)
url="https://github.com/DEAP/deap"
license=(MIT)
depends=(python)
conflicts=()
makedepends=(python-build python-installer python-setuptools python-wheel)
source=($pkgname.$pkgver.tar.gz::"https://github.com/DEAP/deap/archive/refs/tags/1.4.1.tar.gz")
sha256sums=('9da7b57534c94cd622e2bbd2de304c5be696982be89ce4196150f93410f7f2b8')

build() {
  cd "deap-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package(){
  depends+=()
  cd "deap-$pkgver"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

