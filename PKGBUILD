# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=emcee
pkgname=python-$_pyname
pkgver=2.2.1
pkgrel=1
pkgdesc='Kick ass affine-invariant ensemble MCMC sampling'
url="http://dan.iel.fm/emcee"
depends=('python-numpy')
license=('BSD')
arch=('any')
source=("https://github.com/dfm/emcee/archive/v$pkgver.tar.gz")
md5sums=('5958687736cf6296a9c632e46337ac5e')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
