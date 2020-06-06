# Maintainer: Projekt:Root projekt.root@tuta.io
pkgname=recbox-ardour-theme-git
pkgver=r13.35897f5
pkgrel=1
pkgdesc="Dark theme for Ardour with Matcha Dark Sea color schema."
arch=('any')
url="https://gitlab.com/ProjektRoot/recbox-ardour-theme"
license=('MIT')
depends=()
makedepends=('git')
source=('recbox-ardour-theme-git::git+https://gitlab.com/ProjektRoot/recbox-ardour-theme')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p ${pkgdir}/usr/share/ardour6/themes/
  cd "$srcdir/${pkgname}"
  cp recbox-ardour.colors "$pkgdir/usr/share/ardour6/themes/"
}
