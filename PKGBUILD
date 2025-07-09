pkgname=twintaillauncher-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.0
pkgrel=1
pkgdesc='A multi-platform launcher for your anime games'
arch=('x86_64')
license=('GPL-3.0-only')
url=https://github.com/TwintailTeam/TwintailLauncher
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'pango' 'webkit2gtk-4.1' 'hdiffpatch')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "twintaillauncher-git")
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/ttl-v${pkgver}/twintaillauncher_${pkgver}_amd64.deb")
sha256sums=('fc5178c5ab7e93621be7d35a17c76aeeba6324b4c3488f7a143cd544f4077114')
options=('!debug')

build() {
	bsdtar -x -f data.tar.gz
}

package(){
	install -Dm755 usr/bin/twintaillauncher -t $pkgdir/usr/bin
	install -Dm755 usr/lib/twintaillauncher/resources/hpatchz_kuro.exe -t $pkgdir/usr/lib/twintaillauncher/resources
	install -Dm755 usr/lib/twintaillauncher/resources/hpatchz -t $pkgdir/usr/lib/twintaillauncher/resources
	install -Dm644 usr/share/icons/hicolor/32x32/apps/twintaillauncher.png $pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png
	install -Dm644 usr/share/icons/hicolor/128x128/apps/twintaillauncher.png $pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png
	install -Dm644 usr/share/icons/hicolor/256x256@2/apps/twintaillauncher.png $pkgdir/usr/share/icons/hicolor/256x256@2/apps/$_pkgname.png
	install -Dm644 usr/share/applications/twintaillauncher.desktop -t $pkgdir/usr/share/applications
}
