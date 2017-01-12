# Maintainer: Gabriel "ArcturusB" Perouze" <arcturus@openmailbox.org>

pkgname=python-sunpy-git
_gitname=sunpy
pkgver=0.8.dev
pkgrel=2
pkgdesc="Python library for solar physics"
arch=('i686' 'x86_64')
url="http://www.sunpy.org/"
license=('BSD')
depends=('python'
         'python-astropy'
         'python-numpy'
         'python-scipy'
         'python-matplotlib'
         'python-suds-jurko'
         'python-pandas'
         'python-beautifulsoup4'
         'python-sqlalchemy')
makedepends=('git')
provides=(python-sunpy)
conflicts=(python-sunpy)
options=(!emptydirs)
install=
source=(git+https://github.com/sunpy/sunpy)
md5sums=('SKIP')
_gitname=sunpy

pkgver() {
  cd "${_gitname}"
  # printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  printf "%s%s.%s" "$(grep "VERSION = " setup.py | cut -d\' -f2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_gitname}"
  python setup.py install --root="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
