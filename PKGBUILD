# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_marketing_email
_name=trytond_marketing_email
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to manage marketing mailing lists"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('07ebd05eae3aba8d279e2cf9121f4fcd23eab2a6ebd918f044a93992aac76e31')
sha512sums=('66b797dfc64113da76ba2bfabaf07a560c425f22b118eb2ec8f03cad1bea9281cb36de6edba4ff9629d11cdb6b0336d0f23ee550d23cebf2c4f6e43f17a91453')
b2sums=('7c4a56cdfdc167d98bb53e2a4f2df618379dd2d6d920e956630fdd51730a4333cb08177c641c1e9f38611a9ad55716bb3f3982c36197a63d38b3cba312528666')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
