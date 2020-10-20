# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=empyrical
pkgname=python-$_pkgname
pkgver=0.5.5
pkgrel=1
pkgdesc="Common financial risk and performance metrics"
arch=('any')
url="https://github.com/quantopian/empyrical"
license=('APACHE')
depends=('python-scipy' 'python-pandas-datareader')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-parameterized')
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('2d0265546fdb90793bcbb1708b7232f4d744a0ca5f1ba04cc0c2dde2b8af389c')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python runtests.py
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
}
