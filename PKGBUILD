# maintained by: bartus szczepaniak <aur@bartus.33mail.com>

name=uvsquares
pkgname=blender-plugin-${name}-git
pkgver=r63.db80da3
pkgrel=1
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
  addons="$pkgdir/usr/share/blender/$(blender -v | head -n1 | cut -f2 -d ' ')/scripts/addons"
  install -d 755 ${addons}/${name}
  cp -Ta ${name} ${addons}/${name}
}

# vim:set ts=2 sw=2 et:
