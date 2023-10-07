# Maintainer: Francesco Zardi <frazar0 [at] hotmail .dot. it>

_pkgname=lxml-stubs
pkgname=python-$_pkgname
pkgver=0.4.0
pkgrel=1
pkgdesc='Type stubs for the lxml package '
arch=('any')
url="https://github.com/lxml/$_pkgname"
license=('APACHE')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('1d78fc3969be736bd33070eb568f0e1f9bc9827ba707e2507f2de50a0ac982c5eddc0a16698d440173324f3a1298fcf656daa5e3ede360c4cf7e37245eb84bdf')

build() {
  cd $_pkgname-$pkgver

  python -m build -nw
}

package() {
  cd $_pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl
}
