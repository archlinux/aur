# Build from this source tree:  cd packaging/arch && makepkg -si
pkgname=xfce4-net-visualizer-plugin
pkgver=0.1.0
pkgrel=9
pkgdesc="Futuristic Xfce panel network monitor with a rotating wire-mesh globe and traffic chart"
arch=('x86_64' 'aarch64')
license=('GPL-2.0-or-later')
depends=('xfce4-panel' 'libxfce4ui' 'libxfce4util' 'gtk3' 'libsoup3' 'json-glib' 'libmaxminddb' 'iputils')
makedepends=('meson' 'ninja')

build() {
  arch-meson "$startdir/../.." build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
