# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_forecast
_name=trytond_stock_forecast
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module with stock forecasts"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1cd8302a7801a0f7a208b0e9ed4f629990f8bf9a2bf09f6a328342fb91c00093')
b2sums=('d373c08ed49da12bc418c586710079a0fd2ef39b411567bcf5263e73b10f7bdfa63c7597b133263eff74cc1f5a7fdcdfc6a54fb57a09b25809412b3cb32efb96')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
