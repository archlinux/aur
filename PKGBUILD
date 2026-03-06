# Maintainer: Parker Rowen <gitporker@gmail.com>
pkgname=openwork
pkgver=0.11.133
pkgrel=1
pkgdesc="An Open source alternative to Claude Cowork"
arch=('x86_64')
url="https://github.com/different-ai/openwork"
license=('MIT')
depends=('gtk3' 'glib2' 'libayatana-appindicator' 'libsoup3' 'webkit2gtk-4.1' 'openssl' 'dbus' 'librsvg')

source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/openwork-desktop-linux-amd64.deb")
sha256sums=('4ea3fcc9ab390640742cd2148dacc7721e8b3b095d6b94037665c5135d522759')
noextract=("${pkgname}-${pkgver}.deb")

package() {
# Avoids permission issues
  cd "${srcdir}"
  bsdtar -O -xf "${pkgname}-${pkgver}.deb" 'data.tar*' | bsdtar -C "${pkgdir}" -xf -
  if [ -f /usr/bin/opencode ]; then rm -f "${pkgdir}/usr/bin/opencode"; fi;
}
