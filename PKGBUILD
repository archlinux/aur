# Maintainer: Yacob Zitouni <yacob.zitouni@gmail.com>
# Contributor: Michael Kapelko <kornerr@gmail.com>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
# Contributor: David H. Bronke <whitelynx@gmail.com>
# Contributor: Andrea Ratto <andrearatto_liste@yahoo.it>

_name=cx_Oracle
pkgname=python-cx_oracle
pkgver=8.1.0
pkgrel=1
pkgdesc="Python extension module that allows access to Oracle databases"
arch=('i686' 'x86_64')
url='https://oracle.github.io/python-cx_Oracle/'
license=('BSD')
depends=('python' 'oracle-instantclient-basic')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e1698c5522ee1355e552b30bfa0a58e6e772475b882c5d69d158bd7e6aed45de')

package() {
  cd $srcdir/cx_Oracle-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "$pkgdir"/usr/cx_Oracle-doc/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  install -Dm644 "$pkgdir"/usr/cx_Oracle-doc/README.txt "$pkgdir"/usr/share/doc/$pkgname/README.txt
  rm -rf "$pkgdir"/usr/cx_Oracle-doc
}
