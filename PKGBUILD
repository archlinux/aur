# Maintainer: Parker Rowen <gitporker@gmail.com>
pkgname=openwork
pkgver=0.6.1
pkgrel=2
pkgdesc="An Open source alternative to Claude Cowork"
arch=('x86_64')
url="https://github.com/different-ai/openwork"
license=('MIT')
depends=('gtk3' 'glib2' 'libayatana-appindicator' 'libsoup3' 'webkit2gtk-4.1' 'openssl' 'dbus' 'librsvg')

source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/openwork-desktop-linux-amd64.deb")
sha256sums=('d2a34c26d1b9f83d590751e7427f4ee97b0f30fe3ac099840ce43168713973ff')
noextract=("${pkgname}-${pkgver}.deb")

package() {
# Avoids permission issues
  cd "${srcdir}"
  bsdtar -O -xf "${pkgname}-${pkgver}.deb" 'data.tar*' | bsdtar -C "${pkgdir}" -xf -
}
