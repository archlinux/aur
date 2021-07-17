# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=python-svneverever
_name=${pkgname#python-}
pkgver=1.7.1
pkgrel=1
pkgdesc="Collects path entries across SVN history"
arch=('i686' 'x86_64')
url="https://github.com/hartwork/svneverever"
license=('GPL3')
depends=(python python-pysvn)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('f4018bbdf4e2075ca12001fb9cb6e283')

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
