# Maintainer: Denton Liu <liu.denton@gmail.com>
pkgname=crewlink-bin
pkgver=1.1.6
pkgrel=2
pkgdesc='Free, open, Among Us Proximity Chat'
arch=('x86_64')
url='https://github.com/zbanks/CrewLink'
license=('GPL3')
provides=('crewlink')
conflicts=('crewlink')
source=("https://github.com/zbanks/CrewLink/releases/download/v$pkgver-linux/CrewLink-$pkgver.AppImage"
        crewlink)
sha256sums=('3c057ab6f8864a1915a05180d1af53c88ee7550b576d2e3a8efdf7d8280fa446'
            'd94f1847d9e7909de929dc7579cd2ab934872f20faee9822b4abc85c0b0afcc1')

package() {
	cd "$srcdir"

	chmod +x "CrewLink-$pkgver.AppImage"
	./"CrewLink-$pkgver.AppImage" --appimage-extract
	mkdir -p "$pkgdir/opt"
	cp -r squashfs-root "$pkgdir/opt/CrewLink"
	chmod go+rX -R "$pkgdir/opt/CrewLink"
	install -Dm 755 crewlink "$pkgdir/usr/bin/crewlink"
}
