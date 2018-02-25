
# Maintainer: lisuke <1657787678@qq.com>
pkgname=libjudydebian1
pkgver=1.0.5
pkgrel=1

pkgdesc="judy, libjudydebian1.deb"
arch=('armv7h')
conflicts=('judy')
url="https://packages.debian.org/jessie/libjudydebian1"
license=('unknown')
options=('!strip')

makedepends=('tar')
checkdepends=()

source=(
	"http://ftp.cn.debian.org/debian/pool/main/j/judy/${pkgname}_${pkgver}-4_armhf.deb"
		)
noextract=()
md5sums=(
	'7709dfd5297344e1eb1b3b02bbfc9398'
		)
validpgpkeys=()

package() {
	cd ${srcdir}
	ar vx ${pkgname}_${pkgver}-4_armhf.deb || return 1
    tar fx data.tar.xz || return 1
	ls ${srcdir}
	install -D -m755 usr/lib/arm-linux-gnueabihf/libJudy.so.1.0.3 ${pkgdir}/usr/lib/libJudy.so.1 || return 1
	#install -D -m755 usr/lib/arm-linux-gnueabihf/libJudy.so.1 ${pkgdir}/arm-linux-gnueabihf || return 1
	#install -D -m755 usr/lib/arm-linux-gnueabihf/libJudy.so.1.0.3 ${pkgdir}/usr/lib/arm-linux-gnueabihf/libJudy.so.1.0.3 || return 1
}
