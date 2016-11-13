# Maintainer: Nabobalis <nabil.freij@gmail.com>
# Contributor: Nabobalis <nabil.freij@gmail.com>
pkgname=python2-ginga-git
_gitname=ginga
pkgver=r5.664ab42
pkgrel=1
pkgdesc="	A viewer for astronomical data FITS (Flexible Image Transport System) files."
arch=('i686' 'x86_64')
url="http://ejeschke.github.io/ginga/"
license=('BSD')
depends=('python2'
         'python2-astropy'
         'python2-matplotlib'
         'python2-scipy')
provides=(python2-ginga)
conflicts=(python2-ginga)
options=(!emptydirs)
source=(git+https://github.com/ejeschke/ginga)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
  cd $srcdir/ginga
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
