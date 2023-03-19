# Maintainer: Jay Ta'ala <jay@jaytaala.com>

pkgname=gnome-shell-extension-paperwm-redux-git
_pkgname=PaperWM
pkgver=r1974.d492058
pkgrel=1
pkgdesc="Fork of PaperWM (a gnome scrolling window manager) focused on supporting the latest Gnome release(s) and continually implementing fixes and new features quickly."
arch=('any')
url="https://github.com/PaperWM-redux/PaperWM"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
source=("git+https://github.com/PaperWM-redux/PaperWM.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find -type f -exec install -Dm644 {} $pkgdir/usr/share/gnome-shell/extensions/paperwm@paperwm-redux.github.com/{} \;
}
