# Maintainer: SimonBrand <simon.brand@postadigitale.de>
pkgname=mkinitcpio-authentication
pkgver=0.r1.be53c2b
pkgrel=1
pkgdesc="mkinitcpio hook to enable authentication in initramfs"
arch=('any')
url="https://github.com/brandsimon/mkinitcpio-authentication"
license=('GPL')
depends=('mkinitcpio')
optdepends=()
source=("git+https://github.com/brandsimon/mkinitcpio-authentication.git")
sha256sums=('SKIP')

pkgver() {
	cd mkinitcpio-authentication
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/mkinitcpio-authentication"
	install -Dm644 authentication_install \
	    "${pkgdir}/usr/lib/initcpio/install/authentication"
	install -Dm644 authentication_hook \
	    "${pkgdir}/usr/lib/initcpio/hooks/authentication"
}
