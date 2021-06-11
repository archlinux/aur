# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Timm Preetz <timm@preetz.us>

pkgname=python2-pygments
pkgver=2.5.2
pkgrel=2
pkgdesc="Python syntax highlighter"
arch=('any')
url="https://pygments.org/"
license=('BSD')
depends=('python2-setuptools')
source=(https://pypi.org/packages/source/P/Pygments/Pygments-$pkgver.tar.gz)
sha256sums=('98c8aa5a9f778fcd1026a17361ddaf7330d1b7c62ae97c3bb0ae73e0b9b6b0fe')

package() {
  cd "$srcdir/Pygments-$pkgver"

  python2 setup.py install --root="$pkgdir" -O1
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  # pygmentize is included in python-pygments
  rm "$pkgdir/usr/bin/pygmentize"
  rmdir "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
