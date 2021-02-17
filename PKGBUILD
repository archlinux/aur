# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_invoice_correction
_name=trytond_account_invoice_correction
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to correct invoice"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5d4999ab93db92cbc1024c1fd1fa27a92ff5d052feddbbdff1412e91e45a3e24')
sha512sums=('8cb8297e7a023b110db040d41f10af608eeca6c16a33fe841e8cdcb3314af6f1d10eeb422ec612442d3cd713f2baab8ab594f684ec00479e4308adf75d0ac53b')
b2sums=('8f91e3f92939e9199fbb5e732670d42c15ed8a6655ae31bd004cefd17c929d7f084dc287fccf8f1065cddfb2f39455e7a22b9686464f7b57148bc3b79f009476')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
