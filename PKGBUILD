# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_notification_email
_name=trytond_notification_email
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for sending email notifications"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('aeb20ecdabec98ae2a1b96e34d3acd8edb304eda07c59b8193cbcef108231be8')
sha512sums=('8dedc5f14584b9556bf3711767c1d83ebb9521962f0e9432963d4e16488bf8b312cbfd0f3368d2b4d78afa18407f99522d0fba8dadec326dc404c095e940b86d')
b2sums=('dba002c9747df73ca6ec20cba0e3c49d4b42142ebd42764f8dc703fe2df93643d5fd6d2ea135145c54a237897c06c0e8af29ff607b7505126e1ca08f626bba12')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
