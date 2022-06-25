# Maintainer: LanjieYou <ylj18926385312@163.com>
pkgname='cgame2'
pkgver=1.0
pkgrel=1
epoch=0
pkgdesc="五子棋游戏(Chinese Only)"
arch=('x86_64')
url="https://github.com/youlanjie/cgame2"
license=('MIT')
groups=()
depends=('glibc')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/youlanjie/cgame2.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	install -D -m=0755 "bin/main" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m=0644 "res/cgame2.svg" "${pkgdir}/usr/share/icons/cgame2.svg"
	install -D -m=0644 "res/cgame2.desktop" "${pkgdir}/usr/share/applications/cgame2.desktop"
	install -D -m=0644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/etc/cgame2"
	chmod 0777 "${pkgdir}/etc/cgame2"
}
