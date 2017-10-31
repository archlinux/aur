# Maintainer:  Kyle Meyer <kyle@kyleam.com>
# https://github.com/kyleam/maint-aur/tree/master/snakemake

pkgname=snakemake
pkgver=4.3.0
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
source=("https://pypi.io/packages/source/s/snakemake/snakemake-$pkgver.tar.gz")
md5sums=('b0c721e3293aa3acbeb0d0a79a65b945')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
