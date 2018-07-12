# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunk
basever=7.1.2
pkgver=${basever}_a0c72a66db66
pkgrel=1
pkgdesc="Statistical analysis and search tool for logs and machine data"
url="https://www.splunk.com/"
arch=('x86_64' 'i686')
license=('custom')
install="$pkgname.install"
source=("$pkgname.service")
source_i686=("https://download.splunk.com/products/splunk/releases/$basever/linux/$pkgname-${pkgver//_/-}-Linux-i686.tgz")
source_x86_64=("https://download.splunk.com/products/splunk/releases/$basever/linux/$pkgname-${pkgver//_/-}-Linux-x86_64.tgz")
sha256sums=('ca96b85750a0592208facc747bbe1eb22b0a35b6dee841e6f51f1ad6a9157757')
sha256sums_x86_64=('8f3ae2a0f8c178f7a4e0f3a8970861f691dedfd50179cef5adfaff236e82973a')
sha256sums_i686=('06a7486261a9d869b061f2472507ff03fc3e63282f5aeab149e29ff6bd2737d5')

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
