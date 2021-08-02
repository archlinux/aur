# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Daniel Parks <danielrparks@gmail.com>
pkgname=luks-header-integrity
pkgver=1.0.1
pkgrel=1
pkgdesc="A systemd generator and mkinitcpio hook allowing the user to enforce a sha256 hash for disks defined in the crypttab"
arch=(any)
url="https://gitlab.com/danielrparks/luks-header-integrity"
license=('MIT')
groups=()
depends=(mkinitcpio mkinitcpio-busybox systemd)
source=("git+https://gitlab.com/danielrparks/luks-header-integrity?signed#tag=v$pkgver")
noextract=()
sha256sums=(SKIP)
validpgpkeys=("8A144654AD99CA9E984F4156EC74EAEC196A648E")

build() {
	cd "$pkgname"
	make CFLAGS="$CFLAGS $LDFLAGS"
}

package() {
	cd "$pkgname"
	make PREFIX="$pkgdir/usr" install
}
