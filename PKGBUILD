# Contributor: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=qbiobeat-git
pkgver=0.1.6
pkgrel=1
pkgdesc="A small biorhythm application based on PyQt4"
arch=('any')
url="https://github.com/ShadowKyogre/QBioBeat"
license=('GPL')
depends=('python-pyqt4')
source=("${pkgname}"::"git://github.com/ShadowKyogre/QBioBeat.git")
md5sums=(SKIP) #generate with 'makepkg -g'

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  python3 ./setup.py build
}

package()
{
  cd "${srcdir}/${pkgname}"
  python3 ./setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
