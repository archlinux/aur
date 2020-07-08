# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=empyrical
pkgname=python-$_pkgname
pkgver=0.5.4
pkgrel=1
pkgdesc="Common financial risk and performance metrics"
arch=('any')
url="https://github.com/quantopian/empyrical"
license=('APACHE')
depends=('python-pandas' 'python-numpy' 'python-scipy' 'python-pandas-datareader')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('b3727099bc9a9f2b047a4b24a9c1e6dcf7e144ae906226b794343bf766e0f7ca')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
}
