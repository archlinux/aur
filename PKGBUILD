# Maintainer: Alfie Rayner <aa.rayner@outlook.com>
pkgname=opentaikohub-bin
_pkgname=OpenTaiko-Hub
pkgver=0.1.5
pkgrel=1
pkgdesc="Description of your app"
arch=('x86_64')
url="https://github.com/OpenTaiko/OpenTaiko-Hub"
license=('mit')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
pkgver=0.1.7
source_x86_64=("https://github.com/OpenTaiko/OpenTaiko-Hub/releases/download/v$pkgver/OpenTaiko.Hub_"$pkgver"_amd64.deb")
sha256sums_x86_64=('e95a7cbe5cc5ccc474775e6b3e21648249eed7157c6192921b01db6d2c21c0e2')
package() {
	
	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}" 

	find "${pkgdir}" -name "*.desktop" -type f -exec sed -i 's|Exec=OpenTaiko-Hub|Exec=env WEBKIT_DISABLE_COMPOSITING_MODE=1 GDK_BACKEND=x11 OpenTaiko-Hub|g' {} +

}
