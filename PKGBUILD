# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_extra
_name=trytond_sale_extra
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for sale extra"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('63aba1869c7f4060f1a9d68d2973ec0ded13937cf06e143df857c0995e36788e')
sha512sums=('364b4a5bc57e660456a2c3033bce11769b5a680155ae3a9f4f233c6f6ce98f3ce8dae3804d4d95342a5845fa8d3ab2340ce9030e7d0e5be6064d20ff2be7b680')
b2sums=('4dac6dad1984f8d07e54f326d5261f19a8661b60221dba89623be912df0f7f114feaf300ce456f0be0fa1c37cb06ee043fd245bb7fa4682d4e400c3fcc6f0aa8')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
