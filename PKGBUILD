# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=grabserial-git
pkgver=v2.1.0.r42.ga68d2f4
_gitname=grabserial
pkgrel=1
pkgdesc="Serial dump and timing program"
arch=('any')
url="https://github.com/tbird20d/grabserial"
license=('GPL2')
depends=('python-pyserial')
source=("git+https://github.com/tbird20d/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_gitname"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
