# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=python-mathlibtools
pkgver=0.0.10
pkgrel=2
pkgdesc='This package contains leanproject, a supporting tool for Lean mathlib'
arch=('any')
url="https://github.com/leanprover-community/mathlib-tools"
license=('Apache')
depends=(
  'python-toml'
  'python-pygithub'
  'python-certifi'
  'python-gitpython'
  'python-requests'
  'python-click'
  'python-tqdm'
  'python-networkx'
  'python-pydot'
  'python-yaml'
)
makedepends=('python-setuptools')
optdepends=('lean-community')
source=("https://files.pythonhosted.org/packages/fc/21/6b871d00cea09d2e94b9014997b9df160b003f53b4fb89e1cd93ff6f2990/mathlibtools-$pkgver.tar.gz")
sha256sums=(66e86498d4f06cfa83270e907dac5bfba07960884e99c2306410caaedf42e034)

build() {
  cd "mathlibtools-$pkgver"
  python setup.py build
}

package() {
  cd "mathlibtools-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
