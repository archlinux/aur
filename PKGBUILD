_name=agithub
pkgname=python-agithub
pkgver=20220511
pkgrel=1
pkgdesc="Agnostic Github client API -- An EDSL for connecting to REST servers"
arch=(any)
url="https://github.com/mozilla/agithub"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=("git+https://github.com/mozilla/agithub.git")

pkgver() {
  date +%Y%m%d
}
build() {
  cd $_name
  python setup.py build
}

package() {
  cd $_name
  python setup.py install --optimize=1 --root="$pkgdir"
#install -vDm 644 {CHANGELOG,README}.rst -t "$pkgdir/usr/share/doc/$pkgname"
#install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
sha256sums=('SKIP')
