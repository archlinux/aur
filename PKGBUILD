# Maintainer:  Kyle Meyer <kyle@kyleam.com>
# https://github.com/kyleam/maint-aur/tree/master/snakemake

pkgname=snakemake
pkgver=4.0.0
pkgrel=1
pkgdesc='Python-based language and execution environment for GNU Make-like workflows'
arch=('any')
url='https://bitbucket.org/snakemake/snakemake/wiki/Home'
depends=('python' 'python-requests' 'python-wrapt')
makedepends=('python-setuptools')
optdepends=(
  'graphviz: For DAG visualization'
  'python-docutils: For report generation'
)
license=('MIT')
source=("https://pypi.python.org/packages/0d/e1/a811fba2a04d9d86f0a8ef76882194e7ebf1b1f46fa54bd697c022296355/snakemake-4.0.0.tar.gz")
md5sums=('0f316e53e9c0fff9292e97b19e61d6bd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
