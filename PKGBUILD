# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname="airpad"
pkgver=0.2
pkgrel=1
epoch=
pkgdesc="Basic text editor"
arch=("x86_64")
url="https://gitlab.com/oktopod11/airpad"
license=("GPL3")
groups=()
depends=("gtk3" "xdg-utils") 
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://gitlab.com/oktopod11/airpad/raw/master/archive/airpad-${pkgver}.tar.gz")
noextract=()
sha512sums=('8ef206c10c46ce6835fa31eb0ae291f1b3856948c956a0a9ef86cf6b09509a13b298a043fc874021f9d9e3c6ad13529956f2458931ec1d0a4379ff8a311afcf3')

build() {
	cd "$srcdir/$pkgname"
	make build RELEASE=release
	make link
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/32x32/apps/"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps/"
	mkdir -p "$pkgdir/usr/share/applications/"
	make install INSTALLDIR="$pkgdir/usr/bin/" ICONSDIR="$pkgdir/usr/share/icons/hicolor/" APPDIR="$pkgdir/usr/share/applications/"
}

