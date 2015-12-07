# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunkforwarder
pkgver=6.3.1_f3e41e4b37b2
pkgrel=1
pkgdesc="Splunk Universal Forwarder"
url="http://www.splunk.com/"
arch=('x86_64' 'i686')
license=('custom')
conflicts=('splunk')
install="$pkgname.install"
source=(
	"http://download.splunk.com/products/splunk/releases/6.3.1/universalforwarder/linux/$pkgname-${pkgver//_/-}-Linux-$CARCH.tgz"
	"$pkgname.service"
)
sha256sums=(
	'2fcc095b44cdf47855f7c89bbe57b035e53341855a493f7e9f7fc20df004b761'
	'8bd6b2bcf9e9d89d3ab2160c409687313bbee00b7e44b3df3266b44d15a5c152'
)

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
