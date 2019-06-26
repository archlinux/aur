# Maintainer: piernov <piernov@piernov.org>

pkgname=flexbv-bin
pkgver=R1060
pkgrel=1
pkgdesc="FlexBV Professional Boardview"
arch=('x86_64')
url="https://pldaniels.com/flexbv/"
license=('custom')
depends=('sdl2' 'fontconfig' 'sqlite' 'zlib' 'gtk3' 'libpng')
makedepends=()
source=("https://pldaniels.com/flexbv/downloads/FlexBV-R1060-linux.tar.gz"
	"flexbv.sh")
md5sums=('9caa0eb598428c375b2e5314041c26fd'
         'ed44d401465836c03969409246b7ea3a')

package() {
	install -d -m755 "$pkgdir/opt/flexbv"
	cp -a "FlexBV-$pkgver-linux"/* "$pkgdir/opt/flexbv"
	install -D -m755 flexbv.sh "$pkgdir/usr/bin/flexbv"
	ln -s "/tmp/flexbv.log" "$pkgdir/opt/flexbv/flexbv.log"
}
