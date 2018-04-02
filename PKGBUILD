# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Florent H. CARRÉ <colundrum@gmail.com>

pkgname=skippy-xd-git
pkgver=r52.33b4de5
pkgrel=1
pkgdesc="A full-screen task-switcher for X11, similar to Apple's Expose."
arch=("i686" "x86_64")
url="http://code.google.com/p/${pkgname%-git}"
license=("GPL")
depends=("giflib" "libjpeg" "libxcomposite" "libxft" "libxinerama" "xorg-server")
makedepends=("git")
source=("git://github.com/penguinpowernz/${pkgname%-git}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
