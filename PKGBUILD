pkgname=budgie-visualspace-git
pkgver=v0.6.1.r56.g05fda7f
pkgrel=1
pkgdesc="Budgie dynamic workspaces and visualizer script"
arch=('any')
license=('GPL3')
depends=('budgie-desktop' 'budgie-extras')
source=('budgie-extras::git+https://github.com/UbuntuBudgie/budgie-extras')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/budgie-extras/budgie_visualspace"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/budgie-extras/budgie_visualspace"
  rm README.md
  rm visualspace.png
  mkdir -p "${pkgdir}/usr/share/glib-2.0/schemas/"
  cp schema/* "${pkgdir}/usr/share/glib-2.0/schemas/"
  rm -rf schema
  mkdir -p "${pkgdir}/usr/share/budgie-desktop/visualspace/"
  cp ./* "${pkgdir}/usr/share/budgie-desktop/visualspace/"
}
