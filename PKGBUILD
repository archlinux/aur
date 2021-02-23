# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_marketing_automation
_name=trytond_marketing_automation
pkgver=5.8.3
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to plan, coordinate and manage marketing campaigns"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f8394c6726185dbd55bd186c01831050ea7fe31748be6522cb0af0afc19f6ac3')
sha512sums=('60bc03e5b5d97bff913f667ebf624d87a20ca497f5eaeb0b6a6af28a82930fe7ba9f273bc359b874a004f5bd421a049d4cba0f1ed6e896053a3362e021466fac')
b2sums=('b73ad8ecac51c23b5d459c5c0582dde74d7d7c1216aea4284eefdf782e11a70f7c19580c5739b37f3ae0a1c64bb1261254e34b9eac096173048ab10d4b3ca40b')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
