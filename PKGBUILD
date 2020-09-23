# Maintainer: Corey Powell (mistdragon100@gmail.com)
# This is based off the tagged releases in the official hashlink repo
# So if you want official releases, this is the PKGBUILD for you.
pkgname=hashlink
pkgver=1.11
pkgrel=1
pkgdesc="A virtual machine for Haxe (tagged releases)"
url="https://hashlink.haxe.org/"
arch=(x86_64)
license=('MIT')
conflicts=('hashlink-git')
makedepends=()
depends=('libpng' 'libjpeg-turbo' 'libvorbis' 'openal' 'sdl2' 'mbedtls' 'libuv')
source=("https://github.com/HaxeFoundation/hashlink/archive/${pkgver}.tar.gz")
md5sums=('e0c644cd41c9a5f4fcab7864bc7457f3')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make PREFIX="$pkgdir/usr" install
}
