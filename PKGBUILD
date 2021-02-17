# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_forecast
_name=trytond_stock_forecast
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module with stock forecasts"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1cd8302a7801a0f7a208b0e9ed4f629990f8bf9a2bf09f6a328342fb91c00093')
sha512sums=('7bf1d7dfbfc0c2892ab6ce3960980e43232973687e1629bfe584b87941668ffee48dbd9fb7ccabb85caf80e4db53d840c85f57c055efbfb207f9f7842c7f1773')
b2sums=('d373c08ed49da12bc418c586710079a0fd2ef39b411567bcf5263e73b10f7bdfa63c7597b133263eff74cc1f5a7fdcdfc6a54fb57a09b25809412b3cb32efb96')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
