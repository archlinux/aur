# Maintainer: Nabobalis <nabil dot freij at gmail dot com>
# Contributor: Nabobalis <nabil dot freij at gmail dot com>
pkgname=python2-ginga-git
_gitname=ginga
pkgver=20150421
pkgrel=2
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
  cd "$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package(){
  cd $srcdir/ginga
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
