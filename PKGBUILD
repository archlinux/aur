pkgname=pennywise-bin
_pkgname=pennywise
pkgver=0.7.0
pkgrel=1
pkgdesc="Cross-platform application that allows you to open URLs in a floating window that always stays on top."
arch=('i686' 'x86_64')
url="https://github.com/kamranahmedse/pennywise"
license=('MIT')
depends=('gconf' 'libnotify' 'libappindicator-gtk2' 'libxtst' 'nss' 'libxss')
provides=($_pkgname)
conflicts=($_pkgname)
source_i686=("https://github.com/kamranahmedse/$_pkgname/releases/download/v$pkgver/${_pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://github.com/kamranahmedse/$_pkgname/releases/download/v$pkgver/${_pkgname}_${pkgver}_amd64.deb")
source=("https://raw.githubusercontent.com/kamranahmedse/$_pkgname/master/license.md")
sha256sums_i686=('4e01b247a33f54db74eb0f846e0066eb937539635945619c7e5d33ee29a2459a')
sha256sums_x86_64=('aa2d135218915dcd22f72bd0c209f64856de9dc022b7801c8d59973fddc88110')
sha256sums=('b41ccd76edcf9e9af64581622b1d6dc1de7ed55a96548c4af8c43d32cd764b0b')

prepare() {
	bsdtar -xvf data.tar.xz
}

package() {
	install -d $pkgdir/{opt,usr/bin,usr/share/icons/hicolor}
	cp -r opt/* $pkgdir/opt/
	ln -s $pkgdir/opt/Pennywise/$_pkgname $pkgdir/usr/bin/$_pkgname
	install -Dm644 usr/share/applications/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
	cp -a usr/share/icons/hicolor/. $pkgdir/usr/share/icons/hicolor/
	install -Dm644 license.md $pkgdir/usr/share/licenses/$_pkgname/license.md
}
