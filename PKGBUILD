pkgname="argonaut"
pkgver=0.1.0
pkgrel=1
pkgdesc="A node-based image editor for procedural workflows"
arch=('x86_64')
url="https://github.com/davedude1011/argonaut"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
source=("https://github.com/davedude1011/argonaut/releases/download/v${pkgver}/argonaut_${pkgver}_amd64.deb")
sha256sums=('SKIP')  # Replace with actual checksum if preferred

package() {
  # Extract the deb package
  bsdtar -xf "${srcdir}/argonaut_${pkgver}_amd64.deb" -C "${srcdir}"
  
  # Extract the data.tar.gz from the deb
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}