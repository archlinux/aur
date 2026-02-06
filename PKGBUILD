# Maintainer: Parker Rowen <gitporker@gmail.com>
pkgname=openwork
pkgver=0.11.21
pkgrel=2
pkgdesc="An Open source alternative to Claude Cowork"
arch=('x86_64')
url="https://github.com/different-ai/openwork"
license=('MIT')
depends=('gtk3' 'glib2' 'libayatana-appindicator' 'libsoup3' 'webkit2gtk-4.1' 'openssl' 'dbus' 'librsvg')

source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/openwork-desktop-linux-amd64.deb")
sha256sums=('0d31bcfd9cff4d3681485004f3d7cd6ec3661ae41a214022fef39cb0729918f9')
noextract=("${pkgname}-${pkgver}.deb")

package() {
# Avoids permission issues
  cd "${srcdir}"
  bsdtar -O -xf "${pkgname}-${pkgver}.deb" 'data.tar*' | bsdtar -C "${pkgdir}" -xf -
}
