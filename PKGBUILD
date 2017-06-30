# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunkforwarder
basever=6.6.2
pkgver=${basever}_4b804538c686
pkgrel=1
pkgdesc="Splunk Universal Forwarder"
url="https://www.splunk.com/"
arch=('x86_64' 'i686')
license=('custom')
conflicts=('splunk')
install="$pkgname.install"
source=("$pkgname.service")
source_i686=("https://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-${pkgver//_/-}-Linux-i686.tgz")
source_x86_64=("https://download.splunk.com/products/universalforwarder/releases/$basever/linux/$pkgname-${pkgver//_/-}-Linux-x86_64.tgz")
sha256sums=('8bd6b2bcf9e9d89d3ab2160c409687313bbee00b7e44b3df3266b44d15a5c152')
sha256sums_x86_64=('a239432a7991279757387f563418da743e6fe93c94706f4358a8044ff846fc0e')
sha256sums_i686=('a75cba881f42cbfb5738811b648ffb25daf177ddb5d7a2fa6a1229d8c0a8c037')

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
