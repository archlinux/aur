# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=dell-ulnm
pkgver=3.0_038H3
pkgrel=1
pkgdesc="Dell UPS Local Node Manager"
url="http://www.dell.com/"
arch=('x86_64')
license=('custom')
install="$pkgname.install"
source=(
	"http://dragon.bradleylaboon.com/~brad/${pkgname}-${pkgver}.tar.gz"
	"$pkgname.service"
)
sha256sums=(
	'6415ca77fb5f555d91747fbfa043e8f685ceae2d30e635aecd9054dc98719bd9'
	'9a49ff3f5a883329413774c0db9cad2daaa822a006341e8cf7df1b2ac1444640'
)

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	cd "$pkgname-$pkgver"
	install -Dm644 "copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm "copyright"
	mkdir -p "$pkgdir/usr/local/Dell/UPSLocalNodeManager"
	cp -r * "$pkgdir/usr/local/Dell/UPSLocalNodeManager"
}
