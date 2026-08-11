# Maintainer: Pablo Romano <promano7@hotmail.com>
# Original upstream source archive is no longer available.
# Using the Ubuntu source package containing the same upstream snapshot (git20201227.a3e4134).

pkgname=dmg2img
pkgver=1.6.7
pkgrel=6
pkgdesc="A CLI tool to uncompress Apple's compressed DMG files to the HFS+ IMG format"
arch=("i686" "x86_64")
url="http://vu1tur.eu.org/tools/"
license=("GPL-2.0-only")
depends=("openssl" "bzip2" "zlib")
source=(
	"https://archive.ubuntu.com/ubuntu/pool/universe/d/dmg2img/${pkgname}_$pkgver+git20201227.a3e4134.orig.tar.xz"
)
sha256sums=(
	"b802d5c614da9aa21a9b05ba94d02cb3f1d873d0d3f813972f41126a977e4ef4"
)

build() {
	cd "$srcdir/${pkgname}-$pkgver+git20201227.a3e4134"
	make PREFIX="/usr"
}

package() {
	cd "$srcdir/${pkgname}-$pkgver+git20201227.a3e4134"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
