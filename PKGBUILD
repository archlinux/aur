# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunkforwarder
pkgver=6.3.3_f44afce176d0
pkgrel=1
pkgdesc="Splunk Universal Forwarder"
url="http://www.splunk.com/"
arch=('x86_64' 'i686')
license=('custom')
conflicts=('splunk')
install="$pkgname.install"
source_i686=(
	"http://download.splunk.com/products/splunk/releases/6.3.3/universalforwarder/linux/$pkgname-${pkgver//_/-}-Linux-i686.tgz"
	"$pkgname.service"
)
source_x86_64=(
	"http://download.splunk.com/products/splunk/releases/6.3.3/universalforwarder/linux/$pkgname-${pkgver//_/-}-Linux-x86_64.tgz"
	"$pkgname.service"
)
sha256sums_i686=(
	'80aa854cd61c9854d9ff6f6156a32de609a81fd5a9e91f0b0d6633d8a5a9c190'
	'8bd6b2bcf9e9d89d3ab2160c409687313bbee00b7e44b3df3266b44d15a5c152'
)
sha256sums_x86_64=(
	'954b0d6eb5cbbf38cb7e5bf7a68a92f9e25fc3cb3542880e3c0fb68fb2a59a59'
	'8bd6b2bcf9e9d89d3ab2160c409687313bbee00b7e44b3df3266b44d15a5c152'
)

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
