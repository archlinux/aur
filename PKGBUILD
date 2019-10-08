# Maintainer: itsagoodbrain <itsrottenisay@gmail.com>

pkgname=zettlr-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="A markdown editor for writing academic texts and taking notes"
arch=('x86_64')
url="https://www.zettlr.com"
license=('GPL')
depends=()
optdepends=('pandoc: export support'
	    'texlive-bin: pdf etc support')
provides=(zettlr)
source=("https://github.com/Zettlr/Zettlr/releases/download/v${pkgver}/Zettlr-linux-x64-${pkgver}.rpm")
md5sums=(2ad24324ba8123b4ef6659c3fc6238a7)
package() {
	mv $srcdir/opt $pkgdir/opt
	mv $srcdir/usr $pkgdir/usr

	#Needed for SUID issue connected to headless chrome in electron.
	sudo chown root $pkgdir/opt/Zettlr/chrome-sandbox
	sudo chmod 4755 $pkgdir/opt/Zettlr/chrome-sandbox
}
