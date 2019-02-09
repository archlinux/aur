# $Id$
# Maintainer: duffydack <duffydack73 {at] gmail {dot} com>
pkgname=rofimoji-git
_pkgname=rofimoji
pkgver=2.1.0.r0.gbedeb4b
pkgrel=1
pkgdesc="A simple emoji picker for rofi"
depends=('rofi' 'python3' 'xdotool')
optdepends=('noto-fonts-emoji' 'ttf-symbola' 'xsel: copy emoji to clipboard')
arch=('any')
url="https://github.com/fdw/${_pkgname}"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('git')
source=("git+https://github.com/fdw/rofimoji.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $_pkgname
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/rofimoji-git/LICENSE"
  install -D -m755 rofimoji.py "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
