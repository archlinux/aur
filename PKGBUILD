# Maintainer: wincak <wincak@seznam.cz>
pkgname=threshy
pkgver=0.1
pkgrel=0
pkgdesc="ThinkPad battery threshold configuration using TLP and D-Bus"
arch=('x86_64')
url="https://gitlab.com/wincak/threshy"
license=('GPL')
#groups=()
depends=('tlp>=1.0' 'dbus>=1.12' 'qt5-base>=5.9')
makedepends=('cmake>=3.10')
install=
source=("git+https://gitlab.com/wincak/threshy.git#branch=master")
md5sums=('SKIP')

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"

        cmake -DCMAKE_INSTALL_PREFIX="/usr" CMakeLists.txt
        make
}

check() {
	cd "$pkgname"
	#make -k check
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
