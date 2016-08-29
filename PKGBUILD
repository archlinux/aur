# Maintainer:  Kyle Meyer <kyle@kyleam.com>
# https://github.com/kyleam/maint-aur/tree/master/snakemake

pkgname=snakemake
pkgver=3.8.0
pkgrel=1
pkgdesc='Python-based language and execution environment for GNU Make-like workflows'
arch=('any')
url='https://bitbucket.org/snakemake/snakemake/wiki/Home'
depends=('python')
makedepends=('python-setuptools')
optdepends=(
  'graphviz: For DAG visualization'
  'python-docutils: For report generation'
)
license=('MIT')
source=("https://pypi.python.org/packages/92/40/4f4e77fc6e37d492719b916e1d9ca7a35aac0aaa92e9a1dc14da6e80427f/snakemake-3.8.0.tar.gz")
md5sums=('7b0094772430325b234d931d8d72acaf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
