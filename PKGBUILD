# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>

_pkgname=flower
pkgname=python-$_pkgname
pkgver=1.0.0
pkgrel=1
pkgdesc='Real-time monitor and web admin for Celery distributed task queue'
arch=('any')
url='https://github.com/mher/flower'
license=('BSD')
depends=('python-redis')
makedepends=('python-setuptools')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('9f2fb03198291cfa754d803c7088a43dd40d657160b66db7996c43787d553819')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" -O1
  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}
