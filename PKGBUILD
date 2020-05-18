# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=remotely
pkgver=1.0
pkgrel=2
pkgdesc="simple VNC viewer for the GNOME desktop environment"
arch=(i686 x86_64 armv7h aarch64)
url="https://gitlab.gnome.org/World/Remotely"
license=(GPL3)
depends=(gtk-vnc)
makedepends=(meson vala)
source=("https://gitlab.gnome.org/World/Remotely/-/archive/v${pkgver}/Remotely-v${pkgver}.tar.gz")
sha256sums=('d4f849388dcecc0f1206d6a8ec897b92239149861334327d45145d699ffdbaf8')


build() {
  arch-meson "Remotely-v${pkgver}" build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
