# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunk
pkgver=6.3.3_f44afce176d0
pkgrel=1
pkgdesc="Statistical analysis and search tool for logs and machine data"
url="http://www.splunk.com/"
arch=('x86_64' 'i686')
license=('custom')
install="$pkgname.install"
source_i686=(
	"http://download.splunk.com/products/splunk/releases/6.3.3/splunk/linux/$pkgname-${pkgver//_/-}-Linux-i686.tgz"
	"$pkgname.service"
)
source_x86_64=(
	"http://download.splunk.com/products/splunk/releases/6.3.3/splunk/linux/$pkgname-${pkgver//_/-}-Linux-x86_64.tgz"
	"$pkgname.service"
)
sha256sums_i686=(
	'284344325c926b0020951320fc145e39b82c211b9de3227b752b5207534162ea'
	'ca96b85750a0592208facc747bbe1eb22b0a35b6dee841e6f51f1ad6a9157757'
)
sha256sums_x86_64=(
	'a29d88db653f8861fd883f89468ba12df9693f206e5a3c7883d603ba4f790691'
	'ca96b85750a0592208facc747bbe1eb22b0a35b6dee841e6f51f1ad6a9157757'
)

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
