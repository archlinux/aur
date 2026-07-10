# Maintainer: Woro <woro@tanieddosy.pl>
pkgname=reterm-bin
pkgver=0.2.1
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
sha256sums_x86_64=('99200875aa93b6b6c237610f7d9783eb8418dfaf8e68df2c484b80dae1a463f3')

package() {
  tar -xf data.tar.gz -C "${pkgdir}/"
}
