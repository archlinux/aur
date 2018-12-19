# Maintainer: Florijan Hamzic <florijanh@gmail.com>

pkgname=python-oursql
pkgver=0.9.5
pkgrel=1
pkgdesc="new set of MySQL bindings for python3"
arch=('i386' 'x86_64')
url="https://launchpad.net/oursql"
license=('BSD')
depends=('python>=3.1' 'libmariadbclient' 'cython')
makedepends=('python-setuptools')
source=("https://github.com/cinatic/python-oursql/archive/v$pkgver.tar.gz")
sha1sums=('267eb50558a1f97818d4b6766e64673d080ea129')

package() {
  cd "$srcdir/python-oursql-$pkgver"

  cythonize --force oursqlx/oursql.pyx

  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  install -dm755 "$pkgdir/usr/share/licenses/python-oursql"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/python-oursql"
}

# vim:set ts=2 sw=2 et:

