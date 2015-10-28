# Maintainer: Philippe Loctaux <loctauxphilippe@gmail.com>

pkgname=pinbadge-icon-theme
pkgver=0.r89.de5f3a0
pkgrel=1
pkgdesc='A wonderful circular icon pack inspired by OSX!'
arch=('any')
url='https://github.com/Pinbadge/pinbadge-linux-theme'
license=('CCPL:by-sa')
depends=('numix-circle-icon-theme-git')
makedepends=('git')
provides=('pinbadge-icon-theme')
conflicts=('pinbadge-icon-theme')
source=('git+https://github.com/Pinbadge/pinbadge-linux-theme.git')
sha256sums=('SKIP')

pkgver() {
	cd pinbadge-linux-theme/

	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd pinbadge-linux-theme/

	install -dm 755 "$pkgdir"/usr/share/icons
	cp -dr --no-preserve='ownership' Pinbadge "$pkgdir"/usr/share/icons/
}
