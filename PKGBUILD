# Maintainer: meatyari <https://github.com/MeatyAri>
pkgname=slideflare
pkgver=0.1.3
pkgrel=2
pkgdesc="⚡ Blazing fast, interactive presentation tool for developers, educators, and creators"
arch=('x86_64')
url="https://github.com/MeatyAri/slideflare"
license=('MIT')
depends=(
  'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3'
  'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1'
)

# !lto kept for parity with slideflare-git (this binary package runs no
# compile step, so LTOFLAGS never apply here).
options=('!strip' '!emptydirs' '!lto')
install="${pkgname}.install"

source=("slideflare_${pkgver}_amd64.deb::https://github.com/MeatyAri/slideflare/releases/download/app-v${pkgver}/slideflare_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
  # Extract package data
  tar -xvf data.tar.gz -C "${pkgdir}"
}
