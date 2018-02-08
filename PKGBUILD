
# Maintainer: lisuke <1657787678@qq.com>
pkgname=miredo-debian
pkgver=1.2.6
pkgrel=4

pkgdesc="miredo, miredo.deb"
arch=('armv7h')
conflicts=('miredo')
url="https://packages.debian.org/jessie/miredo"
license=('unknown')
options=('!strip')
depends=('libjudydebian1' 'iproute2' 'libcap')
makedepends=('tar')
checkdepends=()

source=(
	"http://ftp.cn.debian.org/debian/pool/main/m/miredo/miredo_${pkgver}-2_armhf.deb"
		)
noextract=()
md5sums=(
	'4680e1bf2fa322d442be326f94490114'
		)
validpgpkeys=()

package() {
	cd ${srcdir}
	ar vx miredo_${pkgver}-2_armhf.deb || return 1
    mkdir root
    tar fx data.tar.xz -C root || return 1
	cp -rfa root/* ${pkgdir}/ || return 1
	ls ${pkgdir}
	
}
