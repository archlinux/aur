# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

name=uvsquares
_blender=$(expac -S %v blender|grep -oP '(?<=\:)[[:digit:]]{1}\.[[:digit:]]{2}(?=\.)')

pkgname=blender-plugin-${name}-git
pkgver=r63.db80da3
pkgrel=3
pkgdesc="Blender addon for reshaping UV selection into grid."
arch=('any')
url="https://cgcookiemarkets.com/blender/all-products/uv-squares/"
license=('GPL')
depends=('blender')
makedepends=('git')
conflicts=('blender-plugin-uvsquares')
source=("${name}::git+https://github.com/Radivarig/UvSquares.git")
md5sums=('SKIP')

pkgver() {
  cd "$name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}
  addons="$pkgdir/usr/share/blender/${_blender}/scripts/addons"
  install -dm755 ${addons}/${name}
  cp -a ${name}/* ${addons}/${name}
}

# vim:set ts=2 sw=2 et:
