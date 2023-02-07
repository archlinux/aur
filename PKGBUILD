# Maintainer: Corey Powell (mistdragon100@gmail.com)
# This is based off the tagged releases in the official hashlink repo
# So if you want official releases, this is the PKGBUILD for you.
pkgname=hashlink
pkgver=1.13
pkgrel=2
pkgdesc="A virtual machine for Haxe (tagged releases)"
url="https://hashlink.haxe.org/"
arch=(x86_64)
license=('MIT')
conflicts=('hashlink-git')
makedepends=()
depends=(
  'libpng'
  'libjpeg-turbo'
  'libvorbis'
  'openal'
  'sdl2'
  'mbedtls'
  'libuv'
  'glu'
)
source=("https://github.com/HaxeFoundation/hashlink/archive/${pkgver}.tar.gz")
md5sums=('d2b6df0c10dd26977c1bceaf1eca7d58')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make PREFIX="$pkgdir/usr" install
}
