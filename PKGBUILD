# Maintaner: Mirko Brombin <send@mirko.pm>
# Contributor: Mirko Brombin <send@mirko.pm>

pkgname=twitz
pkgver=1.1.0
pkgrel=1
pkgdesc='A GTK Twitch client for Linux (Under development)'
arch=('x86_64')
url="https://github.com/mirkobrombin/Twitz"
license=('GPL3')
depends=('hicolor-icon-theme' 'dconf' 'python' 'libhandy' 'gtk3' 'python-gobject' 'python-mpv' 'python-opengl' 'youtube-dl' 'webkit2gtk' 'gst-plugins-good' 'gst-plugins-base' 'gst-libav')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mirkobrombin/Twitz/archive/${pkgver}.tar.gz")
sha256sums=('c39f74e082a6bfcabc363914cf68130bb0e49a68725c024baa5e8297d9fd4467')

build() {
  cd "Twitz-${pkgver}"
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "Twitz-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
