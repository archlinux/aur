# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_product_attribute
_name=trytond_product_attribute
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module with product attributes"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('38a87b33586d4ba7ec9cff49f502b40dc6c7b0d3f2967ea16873e726866879d2')
sha512sums=('2bfa9776d13ea1e4629576d125c3191f502cc8e7b8812c3873aa700c3974b6a85679807d08ffb2dd0dcc9d8b71577d2b1e58b8830a17f51329ee45a01982af73')
b2sums=('ef0fe34779306839ba2dd8c03b894f9b25121512ff7d96c7559264f0ded5e8cee279f507208925866e626e98f9cff9eca02b8920e3c2701fef8625e906d62ca4')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
