# Maintainer: piernov <piernov@piernov.org>

pkgname=flexbv-bin
pkgver=R1060
pkgrel=2
pkgdesc="FlexBV Professional Boardview"
arch=('x86_64')
url="https://pldaniels.com/flexbv/"
license=('custom')
conflicts=('flexbv-beta-bin')
depends=('sdl2' 'fontconfig' 'sqlite' 'zlib' 'gtk3' 'libpng')
makedepends=()
source=("https://pldaniels.com/flexbv/downloads/FlexBV-R1060-linux.tar.gz"
	"flexbv.sh")
md5sums=('9caa0eb598428c375b2e5314041c26fd'
         '1487cbd7315654d30f9133b210d2d55b')

package() {
	install -d -m755 "$pkgdir/opt/flexbv"
	cp -a "FlexBV-$pkgver-linux"/* "$pkgdir/opt/flexbv"
	install -D -m755 flexbv.sh "$pkgdir/usr/bin/flexbv"
	ln -s "/tmp/flexbv.log" "$pkgdir/opt/flexbv/flexbv.log"
}
