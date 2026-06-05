# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>

pkgname=uutils-diffutils-shim
pkgver=0.5.0
pkgrel=1
pkgdesc='Replaces supported GNU diffutils with uutils diffutils'
arch=('any')
url='https://uutils.github.io/diffutils/'
license=('MIT')
depends=('uutils-diffutils')
provides=('diffutils')
conflicts=('diffutils')

package() {
	mkdir -p "$pkgdir/usr/bin"

	local cmd
	for cmd in cmp diff; do
		ln -s diffutils "$pkgdir/usr/bin/$cmd"
	done
}
