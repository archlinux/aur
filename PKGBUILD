# Maintainer:  a.kudelin <kudelin at protonmail dot com>

_pkgname=data-link
pkgname=python-$_pkgname
pkgver=1.0.1
pkgrel=1
pkgdesc="A Python library for Nasdaq Data Link's RESTful API"
arch=('any')
url="https://github.com/Nasdaq/data-link-python"
license=('MIT')
depends=('python-pandas' 'python-inflection' 'python-requests')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('13376308fd7a04edcdb7f782a5fd8ff134d4f43a80ae3c2a716cb3f1bf0e2a14')

build() {
  cd "$srcdir/$_pkgname-python-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-python-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
  install -Dm755 LICENSE.txt -t \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
