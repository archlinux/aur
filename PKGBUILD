# Maintainer: Jan Bader <c.arch@jan.javil.eu>
pkgname="ynab4"
pkgver="4.3.820"
pkgrel=1
epoch=
pkgdesc="You Need A Budget, installs with wine"
arch=("x86_64")
url="http://youneedabudget.com/"
license=('unknown')
groups=()
depends=('wine' 'lib32-lcms' 'lib32-lcms2' 'wine-mono' 'wine_gecko' 'lib32-gnutls' 'lib32-mpg123' 'lib32-ncurses' 'winetricks' 'samba')
makedepends=()
checkdepends=()
optdepends=("dropbox: Needed for YNAB's Cloud-Sync")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(ynab4 "Setup.exe::http://s3.amazonaws.com/cf.download/${pkgname}/YNAB%204_${pkgver}_Setup.exe")
noextract=("Setup.exe")
md5sums=('75854469a4abb1132b93a80c2336d7c6'
         '7b9fc27fb90761085b404cffc07c9de2')

package() {
	install -d -m755 "$pkgdir"/usr/share/ynab4
	cp -raL "$srcdir"/Setup.exe "$pkgdir"/usr/share/ynab4
	
	install -d -m755 "$pkgdir"/usr/bin
	install -m755 ynab4 "$pkgdir"/usr/bin
}