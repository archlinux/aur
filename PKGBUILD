# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_project_invoice
_name=trytond_project_invoice
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to invoice projects"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c6c80271f670d7008c8846b6d5a073dbb3bd2fb9da7e1308c9a01217ee5b322d')
sha512sums=('a1aa381612326db5bf320b850ec527d1be19e062e5bcc22db6a263b4540af5a94875c7386bb6045a68ad710e9de8f4cf61d2b8b99eaea2ded3bf27a730c4598b')
b2sums=('78dbe7d32c115c7886db1d540625ae581fd6da81ba6c48bc0cb95f221221e47179c8b61dbc40e8b147a1432a6df9310c12a89ad21f098e5e5392e9df7a0c80b0')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
