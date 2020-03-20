# Maintainer: revelation60 <benruyl@gmail.com>

pkgname=gnome-shell-extension-gtile-git
pkgver=r205.9535f8b
pkgrel=1
pkgdesc='A window tiling extension for Gnome'
url='https://github.com/gTile/gTile'
license=('GPL')
arch=('any')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
makedepends=('git')
depends=('gnome-shell>=3.32')
optdepends=()
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Copy extension files into place.
  cd "$srcdir/${pkgname}" 
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/gTile@vibou"
  cp -r . "$pkgdir/usr/share/gnome-shell/extensions/gTile@vibou"
}
