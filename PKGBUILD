# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=python-svneverever
_name=${pkgname#python-}
pkgver=1.4.2
pkgrel=1
pkgdesc="Collects path entries across SVN history"
arch=('i686' 'x86_64')
url="https://github.com/hartwork/svneverever"
license=('GPL3')
depends=(python python-pysvn)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('dda1163122f82a9dd47bfbff37432229')

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
