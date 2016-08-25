# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunkforwarder
basever=6.4.3
pkgver=${basever}_b03109c2bad4
pkgrel=1
pkgdesc="Splunk Universal Forwarder"
url="http://www.splunk.com/"
arch=('x86_64' 'i686')
license=('custom')
conflicts=('splunk')
install="$pkgname.install"
source=("$pkgname.service")
source_i686=("http://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-${pkgver//_/-}-Linux-i686.tgz")
source_x86_64=("http://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-${pkgver//_/-}-Linux-x86_64.tgz")
sha256sums=('8bd6b2bcf9e9d89d3ab2160c409687313bbee00b7e44b3df3266b44d15a5c152')
sha256sums_i686=('a3d43fa3fe189a55680c518686e3df50cc21431ac9c00c32842c05cc34c14b5e')
sha256sums_x86_64=('ff819cc0898fbfbfd258e7b76228fa93d07e5cc39fa7d435691d30c5f99d0993')

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
