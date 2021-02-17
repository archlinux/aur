# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_statement_ofx
_name=trytond_account_statement_ofx
pkgver=5.8.2
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to import OFX statements"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7736ac4522549997f36870f3b5ad99f52444607550478eb3dc71d98c33030e9e')
sha512sums=('ea6ae011319472597f922a1893a55a4ad6c986f674bd09a0166b1a25803ac5cfd4bc6a54d13e565eb951798baeb509818fc1db49a9849624c6bfc38d8ab896d8')
b2sums=('53dd7c2456143f04180ff0578540968c255823c86d18ec07717f4cda4a9f2f076fabda4b336b317927405556a6fb98ef6965900731213c5f27e469d7c6121d4f')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
