# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunk
basever=6.6.0
pkgver=${basever}_1c4f3bbe1aea
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
sha256sums_x86_64=('d40248b8e7546988ce88760202a5ff8a6dca4b937c84dc62aa9cd6e6275b619a')
sha256sums_i686=('3519e5e3d78ea98ce9ac8af09f18effec492c12cdd3719b77a9645b869c8aa89')

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
