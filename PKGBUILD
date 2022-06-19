# Maintainer: Emil Blennow <mr.emil101@gmail.com>
_pkgnamebase=wails-dev-tool-kit
pkgname=${_pkgnamebase}-bin
pkgver=3.4.2
pkgrel=1
epoch=
pkgdesc="An example app using wails with useful developer tools"
arch=(x86_64)
license=('MIT')
depends=(webkit2gtk)
checkdepends=()
optdepends=()
url=https://github.com/qaware/dev-tool-kit
install=
source=(
	$_pkgnamebase-$pkgver::"https://github.com/qaware/dev-tool-kit/releases/download/v$pkgver/dev-tool-kit-linux-amd64"
	$_pkgnamebase-$pkgver-src.tar.gz::"https://github.com/qaware/dev-tool-kit/archive/refs/tags/v$pkgver.tar.gz"
	"$_pkgnamebase.desktop")
noextract=()
sha256sums=('4a72c4181bca65c715ab7fc84690a5141b6055b77c8c698ec583752d02c6ed65'
			'd474d136dceaa9cf19be9bf17cc3f5e3852ecee4308bf530cb29f632d6bed6b6'
			'081ba0a52ee7ccee4755894e2def1fe8117532e945ebf4d9a25d5128f2d90967')

package() {
	install -D -m755 "$_pkgnamebase-$pkgver" "$pkgdir/usr/bin/$_pkgnamebase"
	install -D -m644 "$_pkgnamebase.desktop" "$pkgdir/usr/share/applications/$_pkgnamebase.desktop"
	install -D -m644 "dev-tool-kit-$pkgver/appicon.png" "$pkgdir/usr/share/pixmaps/$_pkgnamebase.png"
	install -D -m644 "dev-tool-kit-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
