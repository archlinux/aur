# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=compass-status-git
pkgver=0.1.0
pkgrel=2
pkgdesc="made for someone i love"
arch=('x86_64')
url="https://github.com/l1mey112/compass-status"
license=('GPL3')
depends=()
makedepends=('git' 'gcc' 'make' 'vlang')
source=("compass-status::git+https://github.com/l1mey112/compass-status")
sha512sums=('SKIP')

build() {
	cd compass-status
	v -o compass-status -prod -cc gcc -showcc .
}

package() {
	cd compass-status
	install -Dm755 compass-status   "$pkgdir/usr/bin/compass-status"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/compass-status/LICENSE"
}
