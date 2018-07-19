# Maintainer: linuxSEAT <--put_my_name_here--@gmail.com>

pkgname=python2-libewf-git
_pkgname=libewf
pkgver=20171104
pkgrel=2
pkgdesc="library to access the Expert Witness Compression Format (EWF)"
arch=('any')
url="https://github.com/libyal/libewf/"
license=('LGPL')
groups=()
depends=( 'python2')
makedepends=('python2-setuptools')
provides=('python2-libewf')
conflicts=('python2-libewf')
replaces=()
backup=()
options=(!emptydirs)
install=
source=("git+https://github.com/libyal/libewf.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  export PYTHON=python2

  ./synclibs.sh
  ./autogen.sh
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
