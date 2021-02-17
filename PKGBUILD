# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_google_maps
_name=trytond_google_maps
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to link addresses to Google Maps"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9cfd3f6997b4cd427fa31caf2ec5c15f4aacbf1a6dc839ffbd857597ec547105')
sha512sums=('090a03556f4e914c6924774180eaaef039cc188a2c17679c4a10c0bf368a40e578a3db3434bb7b07d5e03f3a8a1bb739ca0c055fa7f4e6e351899e4b65f47a87')
b2sums=('a83b40a51cbe22bdc6095f9c4b2fb465282b2bebeedb16928de6fd9c5d22576ef116c379531c12117186f8981d77863c06a249c8d4e29ec15ad46566ff7b8416')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
