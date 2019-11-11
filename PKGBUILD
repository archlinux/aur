# Maintainer: Yacob Zitouni <yacob.zitouni@gmail.com>
# Contributor: Michael Kapelko <kornerr@gmail.com>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
# Contributor: David H. Bronke <whitelynx@gmail.com>
# Contributor: Andrea Ratto <andrearatto_liste@yahoo.it>

_name=cx_Oracle
pkgname=python-cx_oracle
pkgver=7.2.2
pkgrel=2
pkgdesc="Python extension module that allows access to Oracle databases"
arch=('i686' 'x86_64')
url='https://oracle.github.io/python-cx_Oracle/'
license=('BSD')
depends=('python' 'oracle-instantclient-sdk')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('406b312a1a6e6ee79bd530bb4390947857bd3ccc060251e56a53024bfd73e6ce')

msg "Warning: The package oracle-instantclient-basic must be installed manually "
plain "unofficial prebuilt Arch packages are available by adding the"
plain "following lines to /etc/pacman.conf, if you agree to the Oracle licence[1]:"
plain ""
plain "  [oracle]"
plain "  SigLevel = Optional TrustAll"
plain '  Server = http://linux.shikadi.net/arch/$repo/$arch/'
plain ""
plain "Then run 'pacman -Sys oracle' to see available packages."
plain ""
plain "[1]: http://www.oracle.com/technetwork/licenses/instant-client-lic-152016.html"
plain ""



package() {
  cd $srcdir/cx_Oracle-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "$pkgdir"/usr/cx_Oracle-doc/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  install -Dm644 "$pkgdir"/usr/cx_Oracle-doc/README.txt "$pkgdir"/usr/share/doc/$pkgname/README.txt
  rm -rf "$pkgdir"/usr/cx_Oracle-doc
}
