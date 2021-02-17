# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_statement
_name=trytond_account_statement
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module with account statements"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('87d5d8ed2f1a1e6c4fe2556b0df5993800d43fafecaa12e2dd602744b4038099')
sha512sums=('37bcf7a8429f9951882fff0b3c33fe0193b43d7004fe4c7c462433dda39e560254ca849b8feedb7455f5dbdfc14892eb5102d221d654ad830b50dee4b61b0f9e')
b2sums=('61e6376666fdde2ae8cef8e019a0089770d777224e5936660449dcc3efb125d086e725f27e4d91513aadb4f2396532ce0c4e81268d02bf8091b99a5da616b3bf')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
