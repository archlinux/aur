# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunkforwarder
basever=7.2.3
pkgver=${basever}_06d57c595b80
pkgrel=1
pkgdesc="Splunk Universal Forwarder"
url="https://www.splunk.com/"
arch=('x86_64' 'armv6h' 'armv7h')
license=('custom')
conflicts=('splunk')
install="$pkgname.install"
source=("$pkgname.service")
source_x86_64=("https://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-${pkgver//_/-}-Linux-x86_64.tgz")
source_armv6h=("https://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-${pkgver//_/-}-Linux-arm.tgz")
source_armv7h=("https://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-${pkgver//_/-}-Linux-arm.tgz")
sha256sums=('8bd6b2bcf9e9d89d3ab2160c409687313bbee00b7e44b3df3266b44d15a5c152')
sha256sums_x86_64=('b80b474951c5091d530c953c0dfc460088c7d6176b60847fcae16e48c94d4231')
sha256sums_armv6h=('4f83a20fc0437d843d42253452b657b207e574e918e9146155c8f99de02a43af')
sha256sums_armv7h=('4f83a20fc0437d843d42253452b657b207e574e918e9146155c8f99de02a43af')

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
