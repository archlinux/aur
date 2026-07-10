# Maintainer: Woro <woro@tanieddosy.pl>
pkgname=reterm-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="SSH, SFTP and RDP client with encrypted cloud sync"
arch=('x86_64')
url="https://reterm.app"
license=('LicenseRef-proprietary')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3'
         'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
provides=('reterm')
conflicts=('reterm')
options=('!strip' '!debug')
install=reterm-bin.install
# Reterm is closed source: this package ships only the prebuilt .deb that the
# desktop-app release workflow mirrors into the public releases repo.
# Tauri names the .deb as {productName}_{version}_amd64.deb.
_dlbase="https://github.com/reterm-app/reterm/releases/download"
source_x86_64=("Reterm_${pkgver}_amd64.deb::${_dlbase}/v${pkgver}/Reterm_${pkgver}_amd64.deb")
sha256sums_x86_64=('b5f1557e04a7515b9e33fef1b4cf02e92a8be5db86588cb801ffac4b97f22dc7')

package() {
  tar -xf data.tar.gz -C "${pkgdir}/"
}
