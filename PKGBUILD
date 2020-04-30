# Maintainer: Joseph Smidt <josephsmidt@gmail.com>

_pkgname=alphalens
pkgname=python-$_pkgname
pkgver=0.4.0
pkgrel=2
pkgdesc="Python Library for performance analysis of predictive (alpha) stock factors."
arch=('any')
url="https://github.com/quantopian/alphalens"
license=('APACHE')
depends=('python-matplotlib' 'python-numpy' 'python-seaborn'
         'python-scipy' 'python-statsmodels' 'python-pandas')
makedepends=('python-setuptools')
source=($pkgname-$pkgver.tar.gz::"$url/archive/v$pkgver.tar.gz")
sha256sums=('4b797228d2bebe6e19aae8e7aa98cc3c33910d1c98a99ef75e3562f2ce7d12df')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
}
