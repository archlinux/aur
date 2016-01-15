# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunkforwarder
pkgver=6.3.2_aaff59bb082c
pkgrel=1
pkgdesc="Splunk Universal Forwarder"
url="http://www.splunk.com/"
arch=('x86_64' 'i686')
license=('custom')
conflicts=('splunk')
install="$pkgname.install"
source_i686=(
	"http://download.splunk.com/products/splunk/releases/6.3.2/universalforwarder/linux/$pkgname-${pkgver//_/-}-Linux-i686.tgz"
	"$pkgname.service"
)
source_x86_64=(
	"http://download.splunk.com/products/splunk/releases/6.3.2/universalforwarder/linux/$pkgname-${pkgver//_/-}-Linux-x86_64.tgz"
	"$pkgname.service"
)
sha256sums_i686=(
	'7e38301cda465921f4eccc817fc5edcecdccf34961f6f8fb7fc2f2a2bcf06d41'
	'8bd6b2bcf9e9d89d3ab2160c409687313bbee00b7e44b3df3266b44d15a5c152'
)
sha256sums_x86_64=(
	'cec2892f5501103203370c65f63953014a7618072e4ff34d053b526879642473'
	'8bd6b2bcf9e9d89d3ab2160c409687313bbee00b7e44b3df3266b44d15a5c152'
)

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
