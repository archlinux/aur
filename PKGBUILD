pkgname="unityx"
pkgver=10.0dev6.r1.gaaa5122
pkgrel=1
pkgdesc="A modern and functional DE"
arch=(any)
depends=("nemo" "fish" "bash" "python3" "python-gobject" "libkeybinder3" "rofi" "feh" "xfwm4" "zenity" "pavucontrol" "blueman" "network-manager-applet" "polybar" "glib2" "conky" "pnmixer-git" "xdotool" "notify-osd" "arandr" "xorg-server-xephyr" "plotinus-unityx-git" "tint2" "hicolor-icon-theme")
makedepends=("fish" "xorg-server-xephyr")
license=("GPL")
source=('unityx::git+https://gitlab.com/ubuntu-unity/unity-x/unityx.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/unityx"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/unityx"
  DESTDIR="${pkgdir}" fish tools/gen_pkg.fish
}
