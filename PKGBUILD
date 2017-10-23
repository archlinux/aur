# Maintainer:  Kyle Meyer <kyle@kyleam.com>
# https://github.com/kyleam/maint-aur/tree/master/snakemake

pkgname=snakemake
pkgver=4.2.0
pkgrel=1
pkgdesc='Python-based language and execution environment for GNU Make-like workflows'
arch=('any')
url='https://bitbucket.org/snakemake/snakemake/wiki/Home'
depends=('python' 'python-requests' 'python-wrapt' 'python-ratelimiter'
         'python-configargparse' 'python-yaml' 'python-appdirs')
makedepends=('python-setuptools')
optdepends=(
  'graphviz: For DAG visualization'
  'python-docutils: For report generation'
)
license=('MIT')
source=("https://pypi.python.org/packages/53/85/6af9903f99bc2eebff1dc4696c93294d89a4a8106c9cc44474c1f96c1781/snakemake-4.2.0.tar.gz")
md5sums=('2968f82257317356a5b8885cc11aae49')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
