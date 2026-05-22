# Maintainer: tpkee
pkgname=foolhammer-mod-manager-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="A straightforward mod manager for Total War games."
arch=('x86_64')
url="https://github.com/tpkee/foolhammer-mod-manager"
license=('GPL-3.0')
options=('!strip' '!debug')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs')
provides=("foolhammer-mod-manager-bin")
source_x86_64=("${url}/releases/download/v${pkgver}/Foolhammer.Mod.Manager_${pkgver}_amd64.deb")
sha256sums_x86_64=('79a86817b20ed162da15ccd465d02a5195f1e929b4c3486752b56626f2b74094')

package() {
  tar -xvf data.tar.gz -C "${pkgdir}"
}

post_install() {
  gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
  update-desktop-database -q
}

post_upgrade() {
  post_install
}

post_remove() {
  gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
  update-desktop-database -q
}
