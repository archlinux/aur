# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=qtarot-git
pkgver=0.5.9
pkgrel=1
pkgdesc="A simple tarot reading program"
arch='any'
url="http://github.com/ShadowKyogre/QTarot/"
license=('GPL')
depends=('pyqt' 'python-lxml')
source=("${pkgname}"::"git://github.com/ShadowKyogre/QTarot.git")
md5sums=(SKIP) #generate with 'makepkg -g'

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package()
{
  cd "${srcdir}/${pkgname}"
  python3 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
