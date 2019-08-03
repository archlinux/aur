# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunkforwarder
basever=7.3.1
pkgver=${basever}_bd63e13aa157
pkgrel=1
epoch=2
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
sha256sums_x86_64=('62c20e294ef96d5dfe06881b28a1dd09b4ce88175583260f48197224953aa18f')
sha256sums_armv6h=('b32f7653ef1ae90a1748eec1328af9b8e3ad5932c92c60564521b3626682187c')
sha256sums_armv7h=('b32f7653ef1ae90a1748eec1328af9b8e3ad5932c92c60564521b3626682187c')

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
