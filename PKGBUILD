# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_web_shortener
_name=trytond_web_shortener
pkgver=5.8.2
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to plug a URL to an action"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5b348265efc090609342d65339a1895aeafea4baf8db32acece8d8670f3f960e')
sha512sums=('8c7fe585d0a78c12fe954fdb09ce623c4ca05fa9c8e950f1f569197414b27a2d0bc106870e30a80698d340e2c86f3d9051cf33db72595d8f252a4d6e58f1235c')
b2sums=('22cc6a1acb43ef7f6900e716f09805ad79657e7f7af2befb5b0cf82310ef44cb344e7330b82907421ceb089a29e4260322120a4142787c60cd186e21cabe23cd')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
