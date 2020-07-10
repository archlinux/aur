# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunkforwarder
basever=8.0.5
splunkver=${basever}-a1a6394cc5ae
# Splunk is inconsistent with the length of their version numbers
if [ ${#basever} -gt 5 ]; then
	pkgver=${basever}
else
	pkgver=${basever}.0
fi
pkgrel=1
epoch=3
pkgdesc="Splunk Universal Forwarder"
url="https://www.splunk.com/"
arch=('x86_64' 'armv6h' 'armv7h')
license=('custom')
conflicts=('splunk')
install="$pkgname.install"
source=("$pkgname.service")
source_x86_64=("https://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-$splunkver-Linux-x86_64.tgz")
source_armv6h=("https://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-$splunkver-Linux-arm.tgz")
source_armv7h=("https://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-$splunkver-Linux-arm.tgz")
sha256sums=('8bd6b2bcf9e9d89d3ab2160c409687313bbee00b7e44b3df3266b44d15a5c152')
sha256sums_x86_64=('5bd50c5ad8d3a2bbe82bbbd03406643ed8a2a712d163bd4e3a48dc9e2c1180d7')
sha256sums_armv6h=('e3c5ee312ce177d9c9ccf6d6eb2183d1da524e9100a563eeb43ad8c7eccc6383')
sha256sums_armv7h=('e3c5ee312ce177d9c9ccf6d6eb2183d1da524e9100a563eeb43ad8c7eccc6383')

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
