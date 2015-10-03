# Maintainer: Philippe Loctaux <loctauxphilippe@gmail.com>

pkgname=pinbadge-icon-theme
pkgver=0.r89.de5f3a0
pkgrel=1
pkgdesc='A wonderful circular icon pack inspired by OSX!'
arch=('any')
url='https://github.com/crutchcorn/pinbadge-icon-theme'
license=('CCPL:by-sa')
makedepends=('git')
provides=('pinbadge-icon-theme')
conflicts=('pinbadge-icon-theme')
source=('git+https://github.com/crutchcorn/pinbadge-icon-theme.git')
sha256sums=('SKIP')

pkgver() {
	cd pinbadge-icon-theme/

	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd pinbadge-icon-theme/

	install -dm 755 "$pkgdir"/usr/share/icons
	cp -dr --no-preserve='ownership' Pinbadge "$pkgdir"/usr/share/icons/
}
