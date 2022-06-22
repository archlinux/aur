# Maintainer: Martel Théo <marteltheo at gmail dot com>
pkgname=bettercrewlink-bin
pkgver=3.0.1
pkgrel=1
pkgdesc='Free, open, Among Us Proximity Chat'
arch=('x86_64')
provides=("bettercrewlink")
url="https://github.com/OhMyGuus/BetterCrewLink"
license=('GPL3')
install="bettercrewlink.install"
depends=('libcap>=2')
source=("https://github.com/OhMyGuus/BetterCrewLink/releases/download/v$pkgver/Better-CrewLink-$pkgver.AppImage"
        "bettercrewlink.desktop"
        "https://raw.githubusercontent.com/OhMyGuus/BetterCrewLink/nightly/src/renderer/logos/BCL-AppIcon.png")
md5sums=('78e82c66cc7acb073cebbb4713d25314'
         '617a6fc40e38cb2be31a1541e39fcf96'
         '0c383871ddf0e11c81cf4cd3a77bd589')
options=(!strip libtool emptydirs staticlibs)

package() {
	cd "$srcdir"
	
	install -Dm 755 "Better-CrewLink-$pkgver.AppImage" "$pkgdir/opt/BetterCrewlink/BetterCrewlink-Linux.AppImage"
	
	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/BetterCrewlink/BetterCrewlink-Linux.AppImage "$pkgdir/usr/bin/bettercrewlink"
	
	install -Dm 644 bettercrewlink.desktop "$pkgdir/usr/share/applications/bettercrewlink.desktop"
	install -Dm 644 BCL-AppIcon.png "$pkgdir/usr/share/pixmaps/bettercrewlink.png"
}
