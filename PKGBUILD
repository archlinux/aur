# Previous Maintainer: David McInnis <davidm@eagles.ewu.edu>
# Contributor: Previous Ismo Toijala <ismo.toijala@gmail.com>
# Contributor: Previous Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Maintainer: khomutsky <bogdan@khomutsky.com>

pkgname=python-numpydoc
pkgver=0.8.0
pkgrel=1
pkgdesc="Sphinx extension to support docstrings in Numpy format"
arch=('any')
url='https://numpydoc.readthedocs.io'
license=('BSD')
depends=('python' 'python-sphinx')
options=('!emptydirs')
source=("https://files.pythonhosted.org/packages/95/a8/b4706a6270f0475541c5c1ee3373c7a3b793936ec1f517f1a1dab4f896c0/numpydoc-${pkgver}.tar.gz")
sha256sums=('61f4bf030937b60daa3262e421775838c945dcdd671f37b69e8e4854c7eb5ffd')

package() {
  cd "$srcdir/numpydoc-$pkgver"

  python setup.py install --root=$pkgdir/ --optimize=1 || return 1

  install -D -m644 "$srcdir/numpydoc-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  chmod 644 "$pkgdir"/usr/lib/python*/site-packages/numpydoc-$pkgver-py*.egg-info/*
}
