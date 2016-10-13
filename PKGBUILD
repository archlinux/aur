# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>

_upstream=qarithmancy

pkgname=qarithmancy-git
pkgver=0.1.4
pkgrel=1
pkgdesc="Comprehensive numerology application using PyQt"
arch=('any')
url="https://github.com/ShadowKyogre/QArithmancy"
license=('GPL')
depends=('pyqt' 'python-dateutil')
source=("${pkgname}::git://github.com/ShadowKyogre/${_upstream}.git")
md5sums=(SKIP) #generate with 'makepkg -g'

pkgver() {
  cd "$pkgname"
  git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package()
{
  cd "${srcdir}/${pkgname}"
  python3 ./setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
