# Maintainer: Parker Rowen <gitporker@gmail.com>
pkgname=openwork
pkgver=0.3.6
pkgrel=2
pkgdesc="An Open source alternative to Claude Cowork"
arch=('x86_64')
url="https://github.com/different-ai/openwork"
license=('MIT')
depends=('gtk3' 'glib2' 'libayatana-appindicator' 'libsoup3' 'webkit2gtk-4.1' 'openssl' 'dbus' 'librsvg')

source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/openwork-desktop-linux-amd64.deb")
sha256sums=('991cd6f6eaa3d871de42b6016b58c69360fceeea4f23a9c82b0101a98252b6c8')
noextract=("${pkgname}-${pkgver}.deb")

package() {
# Avoids permission issues
  cd "${srcdir}"
  bsdtar -O -xf "${pkgname}-${pkgver}.deb" 'data.tar*' | bsdtar -C "${pkgdir}" -xf -
}
