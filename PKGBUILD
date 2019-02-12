pkgname=spi-ch341-usb-dkms
pkgver=r16.79bbe57
pkgver() {
	cd "$srcdir/spi-ch341-usb"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="SPI/GPIO driver for CH341"
arch=(any)
url="https://github.com/gschorcht/spi-ch341-usb"
license=('GPL')
groups=()
depends=()
makedepends=('git')
source=('git+https://github.com/gschorcht/spi-ch341-usb.git')
sha256sums=('SKIP')

package() {
	install -dm0755 "${pkgdir}"/usr/src
	cp -a "${srcdir}"/spi-ch341-usb "${pkgdir}"/usr/src/spi-ch341-usb-$pkgver
	sed -i "s|PACKAGE_VERSION=\".*\"|PACKAGE_VERSION=\"$pkgver\"|" "${pkgdir}"/usr/src/spi-ch341-usb-$pkgver/dkms.conf
}
