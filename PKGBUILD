# Maintainer: Govind K <theamazingndnivog@outlook.com>

pkgname=marvin_dsc
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A minimalist software which helps in setting up an android development environment."
arch=('x86_64')
url="https://github.com/Roidujeu/easy-android-sdk"
license=('MIT')
groups=()
depends=('curl' 'unzip' 'ncurses')
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
source=("$pkgname-$pkgver.tar.xz")
noextract=()
sha256sums=('890e2fa23398c0a39529010a08df75ff63a877270faa873b43ae0ab6cf12586a')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p $pkgdir/usr
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/
	mkdir -p $pkgdir/usr/share/marvin
	mkdir -p $pkgdir/usr/share/marvin/license
	mkdir -p $pkgdir/usr/share/marvin/scripts
	install $srcdir/$pkgname-$pkgver/marvin $pkgdir/usr/bin
	install $srcdir/$pkgname-$pkgver/LICENSE $pkgdir/usr/share/marvin/license/
	install $srcdir/$pkgname-$pkgver/ASDKinstaller.sh $pkgdir/usr/share/marvin/scripts/
	install $srcdir/$pkgname-$pkgver/JDKinstaller.sh $pkgdir/usr/share/marvin/scripts/
	install $srcdir/$pkgname-$pkgver/editorSetup.sh $pkgdir/usr/share/marvin/scripts/
}
