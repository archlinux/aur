# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=pyfolio
pkgname=python-$_pkgname
pkgver=0.9.2
pkgrel=1
pkgdesc="Portfolio and risk analytics in Python"
arch=('any')
url="https://github.com/quantopian/pyfolio"
license=('APACHE')
depends=('python-matplotlib' 'python-pytz' 'python-seaborn'
         'python-empyrical' 'python-scikit-learn')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('8a56e12ddc2a017729a29343806112781e9cdb2cd996f1f493097dbe78e9b16e')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
}
