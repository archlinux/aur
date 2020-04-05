# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=empyrical
pkgname=python-$_pkgname
pkgver=0.5.3
pkgrel=1
pkgdesc="Common financial risk and performance metrics"
arch=('any')
url="https://github.com/quantopian/empyrical"
license=('APACHE')
depends=('python-pandas' 'python-numpy' 'python-scipy' 'python-pandas-datareader')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('25ff9d5bd9ec52a602f54f2edaeb1a19bc10c479b0b67eb8f031a572e15cd47b')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
}
