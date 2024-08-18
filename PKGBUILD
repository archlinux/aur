pkgname=flexbv-bin
pkgver=5.0360
pkgrel=1
pkgdesc="FlexBV Free Professional Boardview"
arch=('x86_64')
url="https://pldaniels.com/flexbv/"
license=('custom')
conflicts=('flexbv-beta-bin')
depends=('sdl2' 'fontconfig' 'sqlite' 'zlib' 'gtk3' 'libpng')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://pldaniels.com/flexbv5/free/FlexBVFree-${pkgver}-linux.tar.gz"
	"flexbv.sh")
sha256sums=('1bcfd1fa10a47a940505f6c4916f0e2ed4b36a054715baa60f8a23efe61a2ee4'
            '462632dd61e766ac7d68374c62d855a21067b021638b80c914b4632f72c2e9c5')

package() {
	install -d -m755 "$pkgdir/opt/flexbv"
	cp -a "FlexBVFree-$pkgver-linux"/* "${pkgdir}/opt/flexbv"
	install -D -m755 flexbv.sh "${pkgdir}/usr/bin/flexbv"
	ln -s "/tmp/flexbv.log" "${pkgdir}/opt/flexbv/flexbv.log"
}
