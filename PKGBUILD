# Maintainer: Jarod G. <skid+aur@tuto-craft.com>
# Contributor: Jarod G. <skid+aur@tuto-craft.com>
pkgname=kolossus-launcher
pkgver="140_29"
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
install=()
source=(https://ifscl.b-cdn.net/kolossus/Kolossus_${pkgver}_Linux.zip Kolossus-Launcher.desktop)
noextract=(Kolossus_${pkgver}_Linux.zip)
md5sums=('a04faf8e76347e600f69a68fdc5f0d20' '73239120e9509b86484fb1b5c0e44f34')
 
prepare() {
	mkdir -p "$pkgname-$pkgver/app"
	chmod 755 -R "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	chmod 777 app
	unzip "$srcdir/Kolossus_${pkgver}_Linux.zip"
}

package() {
	mkdir -p "$pkgdir/opt" "$pkgdir/usr/share/applications"
	mv "$pkgname-$pkgver" "$pkgdir/opt/Kolossus-Launcher"
	install "$srcdir/Kolossus-Launcher.desktop" "$pkgdir/usr/share/applications/"
}
