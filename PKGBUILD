# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunk
basever=7.1.1
pkgver=${basever}_8f0ead9ec3db
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
sha256sums_x86_64=('27a6af84c12a599fd3536b76d0f11fa154237ad651bfa0de0f2908bf56073883')
sha256sums_i686=('50189222c43307de056525fd634c837093ab9c9edc9d191171566ac59af38ff6')

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
