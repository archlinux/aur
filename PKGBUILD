# Maintainer:  Kyle Meyer <kyle@kyleam.com>
# https://github.com/kyleam/maint-aur/tree/master/snakemake

pkgname=snakemake
pkgver=3.5.4
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
source=("https://pypi.python.org/packages/source/s/snakemake/$pkgname-$pkgver.tar.gz")
md5sums=('589c4e5a3ce423743165ac98370a50be')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
