# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_country
_name=trytond_country
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module with countries"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('92c58d55466c5e8a6b6f982017ea7c2325c9f83eeb1f01c57b60ddc2cbbc7ad2')
sha512sums=('ffbd693c1e93b9cd0826c8aa94796794c3362a6b9a9329348b5cfc3ba382781e210a26d85fa230564c533986af662d667a4c9c0094bcd01609bd4d8590dc91ec')
b2sums=('b65da631bd2ece135c06de108d422d326d41173740628070f23cd45a18455f021282fa3df7b47e737e62589a48121ae9f74c2ac3f8f312eaca3786a32461f2b3')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
