# Contributor: Sapphira Armageddos <shadowkyogre.public@gmail.com>

_upstream="myint-move"

pkgname=python-vcs-move-git
pkgver=0.1.3.r11.g26b1ed6
pkgrel=1
pkgdesc="Interactively moves files under revision control using a text editor."
arch=('any')
url="https://github.com/myint/move"
license=('MIT')
depends=('python')
source=("$_upstream"::"git://github.com/myint/move.git")
md5sums=(SKIP) #generate with 'makepkg -g'

pkgver() {
  cd "${srcdir}/${_upstream}"
  git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

package()
{
  cd "${srcdir}/${_upstream}"
  python ./setup.py install --root="$pkgdir"
  mv "${pkgdir}/usr/bin/move" "${pkgdir}/usr/bin/vcs-move"
}

# vim:set ts=2 sw=2 et:
