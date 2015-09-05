# Maintainer: Jan Bader <c.arch@jan.javil.eu>
pkgname="ynab4"
pkgver="4.3.729"
pkgrel=2
epoch=
pkgdesc="You Need A Budget, installs with wine"
arch=("x86_64")
url="http://youneedabudget.com/"
license=('unknown')
groups=()
depends=('wine' 'lib32-lcms' 'lib32-lcms2' 'wine-mono' 'wine_gecko' 'lib32-gnutls' 'lib32-mpg123' 'lib32-ncurses' 'winetricks' 'samba')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(ynab4 "Setup.exe::http://www.youneedabudget.com/CDNOrigin/download/$pkgname/liveCaptive/Win/YNAB%204_${pkgver}_Setup.exe")
noextract=("Setup.exe")
md5sums=("764cd9a8cec68ebcad04427110045267"
	 "0a5df8a115193fe68c4fb5e1cae55326")

package() {
	install -d -m755 "$pkgdir"/usr/share/ynab4
	cp -ra "$srcdir"/Setup.exe "$pkgdir"/usr/share/ynab4
	
	install -d -m755 "$pkgdir"/usr/bin
	install -m755 ynab4 "$pkgdir"/usr/bin
}
