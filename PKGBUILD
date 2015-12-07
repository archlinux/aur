# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunk
pkgver=6.3.1_f3e41e4b37b2
pkgrel=1
pkgdesc="Statistical analysis and search tool for logs and machine data"
url="http://www.splunk.com/"
arch=('x86_64')
license=('custom')
install="$pkgname.install"
source=(
	"http://download.splunk.com/products/splunk/releases/6.3.1/splunk/linux/$pkgname-${pkgver//_/-}-Linux-$CARCH.tgz"
	"$pkgname.service"
)
sha256sums=(
	'a02376ff094c4095d955c15841899e3eb238e6a3316a613c037acc3da4f525ef'
	'ca96b85750a0592208facc747bbe1eb22b0a35b6dee841e6f51f1ad6a9157757'
)

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
