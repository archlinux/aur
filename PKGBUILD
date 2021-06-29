# Maintaner: Mirko Brombin <send@mirko.pm>
# Contributor: Mirko Brombin <send@mirko.pm>

pkgname=amusiz
pkgver=1.3.1
pkgrel=1
pkgdesc='A GTK Amazon Music client for Linux'
arch=('x86_64')
url="https://github.com/mirkobrombin/Amusiz"
license=('GPL3')
depends=('hicolor-icon-theme' 'dconf' 'python' 'libhandy' 'gtk3' 'python-gobject' 'webkit2gtk' 'gst-plugins-good' 'gst-plugins-base' 'gst-libav' )
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mirkobrombin/Amusiz/archive/${pkgver}.tar.gz")
sha256sums=('10c06bfb5c6e5737007b10efd43f700166625321d33c882ab245dc6cc33cca90')

build() {
  cd "Amusiz-${pkgver}"
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "Amusiz-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
