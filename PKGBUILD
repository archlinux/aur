# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Previous maintainer: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>

pkgname=python-numpydoc
pkgver=0.5
pkgrel=1
pkgdesc="Sphinx extension to support docstrings in Numpy format"
arch=('any')
url="https://github.com/numpy/numpydoc"
license=('BSD')
depends=('python' 'python-sphinx')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/n/numpydoc/numpydoc-$pkgver.tar.gz)
sha256sums=('93f050bceb52489d92f85c346981f1962c867c01f233d3252894ceae5cb48d34')

package() {
  cd "$srcdir/numpydoc-$pkgver"

  python setup.py install --root=$pkgdir/ --optimize=1 || return 1

  install -D -m644 "$srcdir/numpydoc-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  chmod 644 "$pkgdir"/usr/lib/python*/site-packages/numpydoc-$pkgver-py*.egg-info/*
}
