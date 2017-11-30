# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Previous maintainer: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>

pkgname=python2-numpydoc
pkgver=0.7.0
pkgrel=1
pkgdesc="Sphinx extension to support docstrings in Numpy format"
arch=('any')
url="https://github.com/numpy/numpy/tree/master/doc"
license=('BSD')
depends=('python2' 'python2-sphinx')
backup=()
options=(!emptydirs)
source=(https://pypi.python.org/packages/21/94/0e087bd669bb69da3b0996acfee97cee9f7d91c825991ad76eb863dc020d/numpydoc-$pkgver.tar.gz)
sha256sums=('2dc7b2c4e3914745e38e370946fa4c109817331e6d450806285c08bce5cd575a')

package() {

  cd "$srcdir/numpydoc-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1

  install -D -m644 "$srcdir/numpydoc-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  chmod 644 "$pkgdir"/usr/lib/python*/site-packages/numpydoc-$pkgver-py*.egg-info/*

}
