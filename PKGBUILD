# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunkforwarder
basever=7.0.3
pkgver=${basever}_fa31da744b51
pkgrel=1
pkgdesc="Splunk Universal Forwarder"
url="https://www.splunk.com/"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
license=('custom')
conflicts=('splunk')
install="$pkgname.install"
source=("$pkgname.service")
source_i686=("https://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-${pkgver//_/-}-Linux-i686.tgz")
source_x86_64=("https://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-${pkgver//_/-}-Linux-x86_64.tgz")
source_armv6h=("https://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-${pkgver//_/-}-Linux-arm.tgz")
source_armv7h=("https://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-${pkgver//_/-}-Linux-arm.tgz")
sha256sums=('8bd6b2bcf9e9d89d3ab2160c409687313bbee00b7e44b3df3266b44d15a5c152')
sha256sums_x86_64=('13d7d1b24426af2b5ee49d0860841238b911926cd9c6237a453350267d65c4fd')
sha256sums_i686=('8e7d3372f05b178294d4142b8641d9ce4555f7e3cf0c78787543a933c94a0697')
sha256sums_armv6h=('e279819cacf18beef11e69798e461bc91c760fcb6e0532c012a938f16920d66f')
sha256sums_armv7h=('e279819cacf18beef11e69798e461bc91c760fcb6e0532c012a938f16920d66f')

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
