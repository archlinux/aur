# Maintainer: Denton Liu <liu.denton@gmail.com>
pkgname=crewlink-bin
pkgver=1.1.6
pkgrel=1
pkgdesc='Free, open, Among Us Proximity Chat'
arch=('x86_64')
url='https://github.com/zbanks/CrewLink'
license=('GPL3')
provides=('crewlink')
conflicts=('crewlink')
source=("https://github.com/zbanks/CrewLink/releases/download/v$pkgver-linux/CrewLink-$pkgver.AppImage"
        crewlink)
sha256sums=('3c057ab6f8864a1915a05180d1af53c88ee7550b576d2e3a8efdf7d8280fa446'
            '80a5eb8b16ef5b92e164bc281cfd1bf5b7f9ff3996dd3122dae67f5356c97531')

package() {
	cd "$srcdir"

	chmod +x "CrewLink-$pkgver.AppImage"
	./"CrewLink-$pkgver.AppImage" --appimage-extract
	mkdir -p "$pkgdir/opt"
	cp -r squashfs-root "$pkgdir/opt/CrewLink"
	chmod go+rX -R "$pkgdir/opt/CrewLink"
	install -Dm 755 crewlink "$pkgdir/usr/bin/crewlink"
}
