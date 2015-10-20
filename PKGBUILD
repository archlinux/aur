# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=jupyter_qtconsole_colorschemes
pkgname=python-$_pyname
pkgver=0.5.2
pkgrel=1
pkgdesc='Color Schemes for Jupyter Qt Console'
url='https://pypi.python.org/pypi/jupyter_qtconsole_colorschemes'
depends=('jupyter')
license=('MIT')
arch=('any')
install=("$pkgname.install")
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.zip"
        'LICENSE')
md5sums=('47f79e2416c1ed6813fd7cbdd7b1847b'
         '1a4308c28090d8b6099856d3dfb7ab54')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
