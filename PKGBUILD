# Contributor: Michael Kapelko <kornerr@gmail.com>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
# Contributor: David H. Bronke <whitelynx@gmail.com>
# Contributor: Andrea Ratto <andrearatto_liste@yahoo.it>
_name=cx_Oracle
pkgname=python-cx_oracle
pkgver=6.1
pkgrel=1
pkgdesc="Python extension module that allows access to Oracle databases"
arch=('i686' 'x86_64')
url='https://oracle.github.io/python-cx_Oracle/'
license=('BSD')
depends=('python' 'oracle-instantclient-sdk')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('733ad162c87b7b2546646961984ff0c41fb78c4f95af0db742337cb4ad3e25011f27ba78ada9724c102b14e21eb7ee66f23bf15baf55454777d0e156cb9c101a')

package() {
  cd $srcdir/cx_Oracle-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir"/usr/share/licenses
  mv "$pkgdir"/usr/cx_Oracle-doc/ "$pkgdir"/usr/share/licenses/$pkgname
}
