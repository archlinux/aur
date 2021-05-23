# Maintaner: Mirko Brombin <send@mirko.pm>
# Contributor: Mirko Brombin <send@mirko.pm>

pkgname=amusiz
pkgver=1.2.0
pkgrel=1
pkgdesc='A GTK Amazon Music client for Linux'
arch=('x86_64')
url="https://github.com/mirkobrombin/Amusiz"
license=('GPL3')
depends=('hicolor-icon-theme' 'dconf' 'python' 'libhandy' 'gtk3' 'python-gobject' 'webkit2gtk')
optdepends=('wine')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mirkobrombin/Amusiz/archive/${pkgver}.tar.gz")
sha256sums=('0fc483073ffd0a983a0ba3ceda6ecd8d9c9785f8ce254125be78dd48babcc07b')

build() {
  cd "Amusiz-${pkgver}"
  meson --prefix='/usr' build
  ninja -C build
}

package() {
  cd "Amusiz-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
