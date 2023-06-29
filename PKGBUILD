# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=python-svneverever
_name=${pkgname#python-}
pkgver=1.7.2
pkgrel=1
pkgdesc="Collects path entries across SVN history"
arch=('i686' 'x86_64')
url="https://github.com/hartwork/svneverever"
license=('GPL3')
depends=(python python-pysvn)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('08cafcd00bc35b47fb07ad1fa7c91172')

prepare() {
  cd "$srcdir/${_name}-$pkgver"
}

build() {
  cd "$srcdir/${_name}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
