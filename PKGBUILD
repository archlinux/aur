# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=sdepy
pkgname=python-$_pkgname
pkgver=1.2.0
pkgrel=1
pkgdesc="Numerical Integration of Ito Stochastic Differential Equations"
arch=('any')
url="https://github.com/sdepy/sdepy"
license=('BSD')
depends=('python-scipy')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::"$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('55ce3985184ed6bc66a7d6a9e902320b70bcf18ecf329f27371109d47a1886d2')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
  install -Dm755 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
