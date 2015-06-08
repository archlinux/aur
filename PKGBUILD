# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=qbiobeat-git
pkgver=20130107
pkgrel=1
pkgdesc="A small biorhythm application based on PyQt4"
arch='any'
url="https://github.com/ShadowKyogre/QBioBeat"
license=('GPL')
depends=('pyqt')
source=()
md5sums=() #generate with 'makepkg -g'

_gitroot=git://github.com/ShadowKyogre/QBioBeat.git
_gitname=QBioBeat


build() {
  cd "${srcdir}"
  if test -d QBioBeat;then
    cd QBioBeat
    git pull
  else
    git clone ${_gitroot} --depth=1
    cd QBioBeat
  fi
  python3 ./setup.py build
}

package()
{
  cd "${srcdir}/QBioBeat"
  python3 ./setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
