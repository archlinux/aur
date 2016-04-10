# Maintainer: Nabil Freij <nabil.freij@gmail.com>

pkgname=gnome-shell-extension-randwall
pkgver=10042016
pkgrel=1
pkgdesc="Gnome shell extension, Random Walls, for automatically change your desktop and lockscreen background randomly."
arch=('any')
url="https://extensions.gnome.org/extension/1000/random-walls/"
license=('GPL')
depends=('gnome-shell')
groups=('gnome-shell-extensions')
akedepends=('git' 'gnome-common')
source=("git+https://github.com/rodakorn/randwall.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/randwall"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/randwall"
  glib-compile-schemas "Random_Walls@Antares/schemas/"
}

package() {
  cd "$srcdir/randwall"
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r "Random_Walls@Antares" "$pkgdir/usr/share/gnome-shell/extensions/"
}
