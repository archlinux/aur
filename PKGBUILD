# Maintainer: Tim Savannah <kata198@gmail.com>

# Just the python2 libs for PopLines.
# The bins are part of "poplines"
#   and depend on python-poplines (python3 libs)

pkgname='python2-poplines'
_realName=popLines
pkgver=2.1.1
pkgrel=1
pkgdesc=""
arch=('any')
license=('GPLv2')
url="http://github.com/kata198/popLines"
makedepends=('python2-setuptools' 'python2')
depends=('python2-setuptools' 'python2')
source=("https://github.com/kata198/popLines/archive/${pkgver}.tar.gz")
sha512sums=("c1d528760681132a7f9d8221e7b591d0f61d0ab1b550586712584fa1da5f11873c82fc0c38ebbd561014a980e7d11e760dbd3bb9a1a883485182561068bf03e6")

build() {
  cd "$srcdir/${_realName}-$pkgver"
  python2 setup.py build
}

package() {
  cd "${_realName}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Remove executables, they come with the "poplines" package (and depend on py3)
  rm -Rf "${pkgdir}/usr/bin"
}

