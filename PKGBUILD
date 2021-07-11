# Maintainer: Jarod G. <skid+aur@tuto-craft.com>
# Contributor: leonekmi <me+git@leonekmi.fr>
pkgname=kolossus-launcher
pkgver="155_48"
pkgrel=1
pkgdesc="Kolossus Launcher, to download the latest version of the IFSCL."
arch=(x86_64)
url="https://en.codelyoko.fr/ifscl/"
license=('custom')
groups=()
provides=()
depends=()
optdepends=()
makedepends=('zip' 'unzip')
conflicts=()
replaces=()
backup=()
source=(https://ifscl.b-cdn.net/kolossus/Kolossus_${pkgver}_Linux.zip Kolossus-Launcher.desktop)
noextract=(Kolossus_${pkgver}_Linux.zip)
md5sums=('e94c03d82e673a458a1048a735faad68'
         '73239120e9509b86484fb1b5c0e44f34')
 
prepare() {
	mkdir -p "$pkgname-$pkgver/app"
	cd "$pkgname-$pkgver"
	unzip "$srcdir/Kolossus_${pkgver}_Linux.zip"
	chmod 775 -R .
	chown root:wheel -R .
}

package() {
	mkdir -p "$pkgdir/opt" "$pkgdir/usr/share/applications"
	mv "$pkgname-$pkgver" "$pkgdir/opt/Kolossus-Launcher"
	install "$srcdir/Kolossus-Launcher.desktop" "$pkgdir/usr/share/applications/"
}
