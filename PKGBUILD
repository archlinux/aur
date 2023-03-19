# Maintainer: LanjieYou <ylj18926385312@163.com>
pkgname='cgame2'
pkgver=1.5.1
pkgrel=1
epoch=0
pkgdesc="五子棋游戏(Chinese Only)"
arch=('x86_64' 'i686')
url="https://github.com/youlanjie/cgame2"
license=('MIT')
depends=('ncurses')
makedepends=('git' 'gcc' 'make' 'glibc')
install=$pkgname.install
source=("$pkgname::git+https://github.com/youlanjie/cgame2.git")
md5sums=("SKIP")

build() {
	cd "$pkgname"
	git submodule init
	git submodule update
	make
}

package() {
	cd "$pkgname"
	install -D -m=0755 "bin/main" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m=0644 "res/cgame2.svg" "${pkgdir}/usr/share/icons/cgame2.svg"
	install -D -m=0644 "res/cgame2.desktop" "${pkgdir}/usr/share/applications/cgame2.desktop"
	install -D -m=0644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
