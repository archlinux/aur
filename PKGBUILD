# Maintainer: Jan Bader <c.arch@jan.javil.eu>
pkgname="ynab4"
pkgver="4.3.857"
pkgrel=2
epoch=
pkgdesc="You Need A Budget, installs with wine"
arch=("x86_64")
url="http://youneedabudget.com/"
license=('unknown')
groups=()
depends=('wine' 'lib32-mpg123' 'lib32-libpulse')
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
source=(ynab4 "Setup.exe::https://web.archive.org/web/20190112221247/https://classic.youneedabudget.com/CDNOrigin/download/${pkgname}/liveCaptive/Win/YNAB%204_${pkgver}_Setup.exe")
noextract=("Setup.exe")
md5sums=('75854469a4abb1132b93a80c2336d7c6'
         'a25c0a73350a99559f1e30c2f86ad0b9')

package() {
	install -d -m755 "$pkgdir"/usr/share/ynab4
	cp -raL "$srcdir"/Setup.exe "$pkgdir"/usr/share/ynab4
	
	install -d -m755 "$pkgdir"/usr/bin
	install -m755 ynab4 "$pkgdir"/usr/bin
}
