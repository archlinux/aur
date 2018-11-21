# Maintainer: steelstrings <steelstring.of.a{at}gmail{dot}com>

pkgname=ozon-colors-icon-theme-git
_pkgname=ozon-icon-theme-folders
pkgver=r7.7d6d24b
pkgrel=2
pkgdesc="Additional folder colors for the default Ozon OS icon theme"
arch=('any')
url="https://github.com/ozonos/ozon-icon-theme"
license=('GPL3')
depends=('gtk-update-icon-cache')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/voyeg3r/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

  # create icon theme dir
  install -d -m 755 "$pkgdir"/usr/share/icons
  
  # install icon theme
  cd "$srcdir"/"$_pkgname"/Ozon-Colored/
  cp -r . "$pkgdir"/usr/share/icons/
}