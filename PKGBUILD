# Maintainer: piernov <piernov@piernov.org>

pkgname=flexbv-unstable-bin
pkgver=R1328
pkgrel=1
pkgdesc="FlexBV Professional Boardview (unstable version)"
arch=('x86_64')
url="https://pldaniels.com/flexbv/"
license=('custom')
conflicts=('flexbv-bin' 'flexbv-unstable-bin')
provides=('flexbv-bin')
depends=('sdl2' 'fontconfig' 'sqlite' 'zlib' 'gtk3' 'libpng')
makedepends=()
source=("https://pldaniels.com/flexbv/alpha/FlexBV-$pkgver-linux.tar.gz"
	"flexbv.sh")
md5sums=('cc404307eb17d1cf13d1cd8bdb3e8563'
         '1487cbd7315654d30f9133b210d2d55b')

package() {
	install -d -m755 "$pkgdir/opt/flexbv"
	cp -a "FlexBV-$pkgver-linux"/* "$pkgdir/opt/flexbv"
	install -D -m755 flexbv.sh "$pkgdir/usr/bin/flexbv"
	ln -s "/tmp/flexbv.log" "$pkgdir/opt/flexbv/flexbv.log"
}
