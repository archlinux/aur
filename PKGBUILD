# Maintainer:  Kyle Meyer <kyle@kyleam.com>
# https://github.com/kyleam/maint-aur/tree/master/snakemake

pkgname=snakemake
pkgver=4.1.0
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
source=("https://pypi.python.org/packages/7e/ba/017268fdb04d9360c4cf1374cb38ddbf4151076811a3278bddb5e509f6c6/snakemake-4.1.0.tar.gz")
md5sums=('0837be028890c810653865ea7546c1fd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
