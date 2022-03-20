# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=chronoslnx-git
pkgver=0.9.8
pkgrel=1
pkgdesc="A simple planetary hours program"
arch=('any')
url="http://shadowkyogre.github.com/ChronosLNX/"
license=('GPL')
depends=('python-pyqt4' 'python-dateutil' 'pyswisseph3')
source=("$pkgname"::"git+https://github.com/ShadowKyogre/ChronosLNX.git")
md5sums=(SKIP) #generate with 'makepkg -g'

pkgver() {
  cd "$pkgname"
  git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package()
{
  cd "${srcdir}/${pkgname}"
  python ./setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
