# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_discount
_name=trytond_sale_discount
pkgver=5.8.2
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module that manages discount on sale"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b5faa106b3ecc474d8b922445e48af88c6e8c2a4dda44bd6102ebac6019ef086')
sha512sums=('849eb957071570bd10d96042414e8e3b670864c66a596946b8570ab06895bdc5851ec7e885cfa5b87ecd6d8253a302414c4f9312e07e0e94aa1e07b8f56c026f')
b2sums=('cb8e0b2bd32cc4678db7be725d57c009713cd531f98c4a44eae182749243f36550955708a06b239c445a4fae60c426958bf67706f10828ff37bdab32faf1a7e9')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
