# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_bank
_name=trytond_bank
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module with banks"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('30627245ffceee603b8e46630e21722a4106d306c58c4f467d388fccb605b093')
sha512sums=('b7f4c38fe7638f19f249d7f241156786d9e58059f85d33435b8d031b94fc74df6f40eaf41f77eaba93bad944437d6ed3b317e635c9d804c880a9bdd6d3c85e49')
b2sums=('c225eda1df132868ea01d796f1dfdd24521ecc0bc995667dd14a6e829b2496492cd801c0d6fd9a1298b337f72b0d9e8a63c6a4ed7b4ed8108bf3ee19a67329b2')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
