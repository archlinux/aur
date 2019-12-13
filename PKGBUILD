# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunkforwarder
basever=8.0.1
splunkver=${basever}-6db836e2fb9e
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
sha256sums_x86_64=('15466f2c8f77725b87c5a2d4c66a543e5e202e96484cd12307f8616107f52575')
sha256sums_armv6h=('485897742301e34522858e5b8beb8a683e8e14e2c47a872a88f84e2841a69d55')
sha256sums_armv7h=('485897742301e34522858e5b8beb8a683e8e14e2c47a872a88f84e2841a69d55')

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
