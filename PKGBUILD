# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Shreyansh Khajanchi <shreyansh_k@live.com>

_pkgname="sqlite-web"
pkgname="python-sqlite-web"
pkgver=0.3.6
pkgrel=1
pkgdesc='Web-based SQLite database browser written in Python'
url='https://github.com/coleifer/sqlite-web'
arch=('any')
license=('MIT')
depends=('python-flask' 'python-peewee' 'python-pygments')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/coleifer/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('b4451218ca16130dd679fac6e2f7356f1568c760557856ba1e3dd7295a6f2925883aa61d936c1f487578e854734ba8f5ddd3a380d5beb5ccd1d88c9aec386015')


build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$_pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
