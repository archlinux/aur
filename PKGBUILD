# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunk
basever=7.2.5.1
pkgver=${basever}_962d9a8e1586
pkgrel=1
epoch=1
pkgdesc="Statistical analysis and search tool for logs and machine data"
url="https://www.splunk.com/"
arch=('x86_64')
license=('custom')
install="$pkgname.install"
source=("$pkgname.service")
source_x86_64=("https://download.splunk.com/products/splunk/releases/$basever/linux/$pkgname-${pkgver//_/-}-Linux-x86_64.tgz")
sha256sums=('ca96b85750a0592208facc747bbe1eb22b0a35b6dee841e6f51f1ad6a9157757')
sha256sums_x86_64=('da8041ab9a3d4fe9db7efc7cafb0ce50bae31c922daf25855001b5dc7c49a398')

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
