# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=emcee
pkgname=python-$_pyname
pkgver=2.1.0
pkgrel=1
pkgdesc='Kick ass affine-invariant ensemble MCMC sampling'
url="http://dan.iel.fm/emcee"
depends=('python-numpy')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('c6b6fad05c824d40671d4a4fc58dfff7')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
