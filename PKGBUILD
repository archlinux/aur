# Maintainer: Darnell Andries <darnell@andries.ca>
pkgname=sbsimple
pkgver=0.1.2
pkgrel=1
epoch=
pkgdesc="Utility for setting up UEFI secure boot in a simple way"
arch=('x86_64')
url="https://github.com/DJAndries/sbsimple"
license=('MIT')
groups=()
depends=('openssl' 'coreutils' 'util-linux' 'efitools' 'sbsigntools' 'zenity' 'efibootmgr')
makedepends=('git')
checkdepends=()
optdepends=('grub')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()

source=($(ls | grep "^\(sbsimple[a-z\-]*\|LICENSE\)$"))
sha256sums=()
for i in "${!source[@]}"; do
	sha256sums[i]="SKIP"
done

md5sums=()
validpgpkeys=()

package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/sbsimple"

	cp "sbsimple" "$pkgdir/usr/bin/sbsimple"
	chmod 755 "$pkgdir/usr/bin/sbsimple"
	for FILE in sbsimple-*; do
		cp "$FILE" "$pkgdir/usr/share/sbsimple/$FILE"
	done

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	chmod -R 755 "$pkgdir/usr/share/sbsimple"
}
