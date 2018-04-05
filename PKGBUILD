# Maintainer: BrainDamage
pkgname="jack_autoconnect-git"
pkgver=20180405.155ed79
pkgrel=2
pkgdesc="Tiny application that reacts on port registrations by jack clients and connects them"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/kripton/jack_autoconnect"
license=("GPL")
depends=("qt5-base")
makedepends=("git")
md5sums=("SKIP")
source=("git+https://github.com/kripton/jack_autoconnect")

pkgver() {
	cd jack_autoconnect
	#uuuugly code to use date + current git hash in lieu of absent release tag
	echo "$(date +%Y%m%d).$(git describe --always)"
}

build() {
	cd jack_autoconnect
	qmake .
	make
}

package() {
	cd jack_autoconnect
	install -D jack_autoconnect "$pkgdir"/usr/bin/jack_autoconnect
}
