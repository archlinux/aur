# Maintainer: Doommsatic <keniscoolu@gmail.com>
pkgname=('sonic-1' 'sonic-2')
pkgbase=sonic-2013
pkgver=1.1.2
pkgrel=1
pkgdesc="Decompilation of the mobile ports by Taxman"
arch=(x86_64)
url="https://github.com/Rubberduckycooly/Sonic-1-2-2013-Decompilation"
license=('unknown')
depends=('sdl2' 'libvorbis' 'libogg')
source=("https://github.com/Rubberduckycooly/Sonic-1-2-2013-Decompilation/archive/$pkgver.tar.gz"
    "sonic1.install"
	"sonic2.install"
	"sonic1.sh"
	"sonic2.sh")
md5sums=('f4c91f0ec87edd67d508c9b88473c357'
         '604d9d9d8356e484afbe1171e342bbe1'
         '9ec41b899affd1aed9eda74ab1e7d308'
         'ceac785ff2832d5d2c4ee83c145cd4dd'
         'aac2f37fd3822f680d9695e4ca415d3f')
validpgpkeys=()

build() {
	cd "Sonic-1-2-2013-Decompilation-$pkgver"
	make
}

package_sonic-1() {
	# options and directives that can be overridden
	pkgdesc="Sonic 1 mobile port decompilation"
	install=sonic1.install
	install -Dm 0755 sonic1.sh $pkgdir/usr/bin/sonic1
	cd "Sonic-1-2-2013-Decompilation-$pkgver"
	install -Dm 0755 bin/RSDKv4 $pkgdir/opt/sonic2013/sonic-1

}

package_sonic-2() {
	# options and directives overrides
	pkgdesc="Sonic 2 mobile port decompilation"
	install=sonic2.install
	install -Dm 0755 sonic2.sh $pkgdir/usr/bin/sonic2
	cd "Sonic-1-2-2013-Decompilation-$pkgver"
	install -Dm 0755 bin/RSDKv4 $pkgdir/opt/sonic2013/sonic-2
}
