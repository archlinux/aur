# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Previous maintainer: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>

pkgname=python2-numpydoc
pkgver=0.6.0
pkgrel=1
pkgdesc="Sphinx extension to support docstrings in Numpy format"
arch=('any')
url="https://github.com/numpy/numpy/tree/master/doc"
license=('BSD')
depends=('python2' 'python2-sphinx')
backup=()
options=(!emptydirs)
install=
source=(http://pypi.python.org/packages/source/n/numpydoc/numpydoc-$pkgver.tar.gz)
md5sums=('5f1763c44e613850d56ba1b1cf1cb146')

package() {

  cd "$srcdir/numpydoc-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1

  install -D -m644 "$srcdir/numpydoc-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  chmod 644 "$pkgdir"/usr/lib/python*/site-packages/numpydoc-$pkgver-py*.egg-info/*

}
