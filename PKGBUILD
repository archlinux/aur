# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Daniel Larsson <znixen@live.se>

pkgbase=patool
pkgname=('patool' 'patool-py2')
pkgver=1.12
pkgrel=4
pkgdesc="portable command line archive file manager"
arch=('any')
url="https://wummel.github.io/patool/"
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
optdepends=("tar: extracting TAR files"
    "unrar: extracting RAR files"
    "p7zip: extracting ZIP and 7z files")
#source=("https://pypi.python.org/packages/source/p/$pkgbase/$pkgbase-$pkgver.tar.gz")
source=("$pkgbase-$pkgver.tar.gz::https://github.com/wummel/patool/archive/upstream/1.12.tar.gz")
sha256sums=('582fd4b87c263325958c1550400504799018c88bc3444f249bba304ae1747f1f')


package_patool() {
  pkgdesc+=" (Python3)"
  depends=('python')

  cd "${pkgbase}-upstream-${pkgver}"
  python setup.py install --root=$pkgdir --prefix=/usr --optimize=1
}

package_patool-py2() {
  pkgdesc+=" (Python2)"
  depends=('python2')
  conflicts=('patool')

  cd "${pkgbase}-upstream-${pkgver}"
  python2 setup.py install --root=$pkgdir --prefix=/usr --optimize=1
}
