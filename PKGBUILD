# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=qtarot-git
pkgver=0.5.9
pkgrel=2
pkgdesc="A simple tarot reading program"
arch=('any')
url="http://gitlab.com/ShadowKyogre/QTarot/"
license=('GPL')
makedepends=('git')
depends=('python-pyqt4' 'python-lxml')
source=("${pkgname}"::"git+https://gitlab.com/ShadowKyogre/QTarot.git")
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
