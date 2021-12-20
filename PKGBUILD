# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Kyle Meyer <kyle@kyleam.com> https://github.com/kyleam/maint-aur
pkgname=python-ratelimiter
_pkgname=${pkgname#python-}
pkgver=1.2.0.post0
pkgrel=3
pkgdesc='Simple Python module providing rate limiting'
arch=('any')
url="https://github.com/RazerM/ratelimiter"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest>=3.0')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b8dbff5bdfd922126f20cd513473cfd0d61b017cd354cb641a3d50b62897eca9')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
