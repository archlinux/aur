# Maintaner: Mirko Brombin <send@mirko.pm>
# Contributor: Mirko Brombin <send@mirko.pm>

pkgname=amusiz
pkgver=1.3.0
pkgrel=1
pkgdesc='A GTK Amazon Music client for Linux'
arch=('x86_64')
url="https://github.com/mirkobrombin/Amusiz"
license=('GPL3')
depends=('hicolor-icon-theme' 'dconf' 'python' 'libhandy' 'gtk3' 'python-gobject' 'webkit2gtk' 'gst-plugins-good' 'gst-plugins-base' 'gst-libav' )
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mirkobrombin/Amusiz/archive/${pkgver}.tar.gz")
sha256sums=('197d269c73e0b10b52d4150926334f6760c4bcb240864f72273530a62138280d')

build() {
  cd "Amusiz-${pkgver}"
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "Amusiz-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
