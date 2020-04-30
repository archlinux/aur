# Maintainer: Joseph Smidt <josephsmidt@gmail.com>

_pkgname=alphalens
pkgname=python-$_pkgname
pkgver=0.4.0
pkgrel=1
pkgdesc="Python Library for performance analysis of predictive (alpha) stock factors."
arch=('any')
url="https://github.com/quantopian/alphalens"
license=('APACHE')
depends=('python-matplotlib' 'python-numpy' 'python-seaborn'
         'python-scipy' 'python-statsmodels' 'python-pandas')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('5b64f3000b4562b894cd14859f39bbb070a8fe8f6684dc84cdc79f3eb991e0b3')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
}
