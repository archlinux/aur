# Maintainer: David McInnis <davidm@eagles.ewu.edu>
# Contributor: Previous Ismo Toijala <ismo.toijala@gmail.com>
# Contributor: Previous Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Previous maintainer: 

pkgname=python-numpydoc
pkgver=0.6.0
pkgrel=1
pkgdesc="Sphinx extension to support docstrings in Numpy format"
arch=('any')
url="https://github.com/numpy/numpydoc"
license=('BSD')
depends=('python' 'python-sphinx')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/n/numpydoc/numpydoc-$pkgver.tar.gz)
sha256sums=('1ec573e91f6d868a9940d90a6599f3e834a2d6c064030fbe078d922ee21dcfa1')

package() {
  cd "$srcdir/numpydoc-$pkgver"

  python setup.py install --root=$pkgdir/ --optimize=1 || return 1

  install -D -m644 "$srcdir/numpydoc-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  chmod 644 "$pkgdir"/usr/lib/python*/site-packages/numpydoc-$pkgver-py*.egg-info/*
}
