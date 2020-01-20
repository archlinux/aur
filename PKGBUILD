# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=remotely
pkgver=1.0
pkgrel=1
pkgdesc="A GTK3 VNC Client"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://gitlab.gnome.org/haecker-felix/Remotely"
license=('GPL3')
depends=('gtk-vnc')
makedepends=('meson' 'vala')
source=("https://gitlab.gnome.org/World/Remotely/-/archive/v${pkgver}/Remotely-v${pkgver}.tar.gz")
md5sums=('35b9d43f36fbb743de7b8819f0981d10')


build() {
  arch-meson "Remotely-v${pkgver}" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}
