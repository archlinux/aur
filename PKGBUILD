# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=qarithmancy-git
pkgver=20130111
pkgrel=1
pkgdesc="Comprehensive numerology application using PyQt"
arch='any'
url="https://github.com/ShadowKyogre/QArithmancy"
license=('GPL')
depends=('pyqt' 'python-dateutil')
source=()
md5sums=() #generate with 'makepkg -g'

_gitroot=git://github.com/ShadowKyogre/QArithmancy.git
_gitname=QArithmancy


build() {
  cd "${srcdir}"
  if test -d QArithmancy;then
    cd QArithmancy
    git pull
  else
    git clone ${_gitroot} --depth=1
    cd QArithmancy
  fi
  python3 ./setup.py build
}

package()
{
  cd "${srcdir}/QArithmancy"
  python3 ./setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
