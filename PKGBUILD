# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_payment
_name=trytond_sale_payment
pkgver=5.8.2
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module that manage payments on sale"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7da633bb218d6bfcef1dc009c15d8ad1c85dc576f13e2d21d306ffb75b734db2')
sha512sums=('1175bc61017daa782eff753af0db487f0d0783f25d3909010d27416cfbe79bee693410f0fecc530ad424cdfc688d5b05defc06ac79c6084786770fe09c2c1306')
b2sums=('32d93aaa09e4a7247707d4e94e9e2e18bf11b6af838854268c91cc806ceac97d68b20e1826d96af32696c72ee296b962c76a36626d441141d9d03ef76a747198')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
