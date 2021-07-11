# Maintainer: Jarod G. <skid+aur@tuto-craft.com>
# Contributor: leonekmi <me+git@leonekmi.fr>
pkgname=kolossus-launcher
pkgver="155_48"
pkgrel=3
pkgdesc="Kolossus Launcher, to download the latest version of the IFSCL."
arch=(x86_64)
url="https://en.codelyoko.fr/ifscl/"
license=('custom')
groups=()
provides=()
depends=('bash')
optdepends=()
makedepends=('zip' 'unzip')
conflicts=()
replaces=()
backup=()
install="kolossus-launcher.install"
source=(https://ifscl.b-cdn.net/kolossus/Kolossus_${pkgver}_Linux.zip Kolossus-Launcher.desktop install.sh kolossus-launcher.install)
noextract=(Kolossus_${pkgver}_Linux.zip)
md5sums=('e94c03d82e673a458a1048a735faad68'
         '51d205515237b6d61ed7ed3379ed6d5f'
         '7b021b2e6213b951d81dc95b0d1f5745'
         '6cbd8a292f3700ffe4a1150d607542cc')
 
prepare() {
	mkdir -p "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	unzip "$srcdir/Kolossus_${pkgver}_Linux.zip"
}

package() {
	mkdir -p "$pkgdir/opt" "$pkgdir/usr/share/applications"
	install -d -m755 "$pkgname-$pkgver" "$pkgdir/opt/Kolossus-Launcher"
	install -m755 "$srcdir/install.sh" "$pkgdir/opt/Kolossus-Launcher"
	install "$srcdir/Kolossus-Launcher.desktop" "$pkgdir/usr/share/applications/"
}
