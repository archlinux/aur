# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Daniel Larsson <znixen@live.se>

pkgbase=patool
pkgname=('patool' 'patool-py2')
pkgver=1.12
pkgrel=1
pkgdesc="portable command line archive file manager"
arch=('any')
url="https://wummel.github.io/patool/"
license=('GPL')
makedepends=('python' 'python2')
optdepends=("tar: extracting TAR files"
    "unrar: extracting RAR files"
    "p7zip: extracting ZIP and 7z files")
source=("https://pypi.python.org/packages/source/p/$pkgbase/$pkgbase-$pkgver.tar.gz")
sha256sums=('e3180cf8bfe13bedbcf6f5628452fca0c2c84a3b5ae8c2d3f55720ea04cb1097')


package_patool() {
  pkgdesc+=" (Python3)"
  depends=('python')

  cd "$srcdir/${pkgbase}-${pkgver}"

  python setup.py install --root=$pkgdir --prefix=/usr
}

package_patool-py2() {
  pkgdesc+=" (Python2)"
  depends=('python2')
  conflicts=('patool')

  cd "$srcdir/${pkgbase}-${pkgver}"

  python2 setup.py install --root=$pkgdir --prefix=/usr
}
