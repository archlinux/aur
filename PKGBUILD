# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=xylose
pkgname=('python-scielo-xylose')
pkgver=1.35.11
pkgrel=1
pkgdesc="SciELO's library to abstract a JSON from ISIS2JSON type 3 results"
arch=('any')
url='https://github.com/scieloorg/xylose'
license=('BSD')
makedepends=('python-setuptools')
depends=('python-scielo-legendarium')
options=(!emptydirs)
sha256sums=('c399b3751db586851b52dc28635e8ccdfb98917a926777418a280cef49312dfd')
source=("$_name-v$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
