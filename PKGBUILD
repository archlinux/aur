# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_opportunity
_name=trytond_sale_opportunity
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module with leads and opportunities"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('eaa918e897925b88b8e42c156f0991e4c78567ff99454813f8886b7b65684763')
b2sums=('a019f058827e5a1a90c61ffa672211516d7a357efd4955bfdb7d0b370ddd767ac1b09b39fd0f6ee37436edb4e06463f1b0c3349abde43dc7fd88aa5850f3d67b')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
