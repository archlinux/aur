pkgname=openwork-bin
pkgver=0.11.194
pkgrel=1
pkgdesc="Open source alternative to Claude Cowork desktop app"
arch=('x86_64')
url="https://github.com/different-ai/openwork"
license=('MIT')
depends=(
  'dbus'
  'glib2'
  'gtk3'
  'libayatana-appindicator'
  'librsvg'
  'libsoup3'
  'openssl'
  'webkit2gtk-4.1'
)
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/openwork-desktop-linux-amd64.deb")
sha256sums=('ecf931d3919f3ac02aa5a802e42892a2c0892c1264904bdbec2bfccd901fa7f8')
noextract=("${pkgname}-${pkgver}.deb")

package() {
  cd "${srcdir}"

  bsdtar -O -xf "${pkgname}-${pkgver}.deb" 'data.tar*' | bsdtar -C "${pkgdir}" -xf -

  # Keep the standalone opencode package as the owner of /usr/bin/opencode.
  rm -f "${pkgdir}/usr/bin/opencode"
}
