# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_amendment
_name=trytond_sale_amendment
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to amend sales"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c156a5d934c4bb345482696f631c9d8e2a217786d1c5de2cd1770d901a92cdcd')
sha512sums=('bd6adf27f38a39d57241a699304033c672c12f1c7449bbfd68d7e89e127c5a0022189d52a9382bcdb553b2db01768e2ccda9c621acc68ddeb861435f45c818a1')
b2sums=('452a56451a2981c28ab625fcdb7a8495c4b33a7e15159438ff969f405a62cc6b2ea1378c46e8408f1c7666b1a404c50a92b7547ca5fcc04ef114fea851df310d')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
