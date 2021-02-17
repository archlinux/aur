# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_marketing
_name=trytond_marketing
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to group marketing features"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e4b3bc53dd427c162bc41630f5ccdcc0091756d43648e2e3161c6cac8a4c298e')
sha512sums=('d370358100e3bbd762c55c609b21d16470da04057631656dcc9efc11643d3236d7828f48d47d57b23707383762641bf3f73393fda6de51183caaca1dee35a3cd')
b2sums=('f6b326059c67aa69f54b0938a1c8ff1dcfda348519fcfb6a0eb10681eb8d9342aeca1ee0a5877417fa0b1a1d7770f9ea604c7ed79b29bb9c1ced067a40b45772')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
