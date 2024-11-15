# Contributor: Charles Milette <charles.milette@gmail.com>

pkgname=terminology-themes-git
pkgver=r119.e1ddd06
pkgrel=1
pkgdesc="Color schemes for the Terminology terminal emulator"
arch=('any')
url="https://github.com/sylveon/terminology-themes"
license=('GPL-3.0-or-later')
makedepends=('efl' 'git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-git}"
	make all
}

package() {
	cd "${pkgname%-git}"
	make DESTDIR="$pkgdir" install
}
