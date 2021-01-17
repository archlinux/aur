# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_google_maps
_name=trytond_google_maps
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to link addresses to Google Maps"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9cfd3f6997b4cd427fa31caf2ec5c15f4aacbf1a6dc839ffbd857597ec547105')
b2sums=('a83b40a51cbe22bdc6095f9c4b2fb465282b2bebeedb16928de6fd9c5d22576ef116c379531c12117186f8981d77863c06a249c8d4e29ec15ad46566ff7b8416')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
