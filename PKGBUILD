# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
pkgname=splunk
pkgver=6.3.2_aaff59bb082c
pkgrel=1
pkgdesc="Statistical analysis and search tool for logs and machine data"
url="http://www.splunk.com/"
arch=('x86_64' 'i686')
license=('custom')
install="$pkgname.install"
source=(
	"http://download.splunk.com/products/splunk/releases/6.3.2/splunk/linux/$pkgname-${pkgver//_/-}-Linux-$CARCH.tgz"
	"$pkgname.service"
)
if [ $CARCH == 'i686' ]; then
	sha256sums=(
		'b2ba9fe5e3666d454737c960d25ae0b4e74423f68ddc62b4c280c337355143f3'
		'ca96b85750a0592208facc747bbe1eb22b0a35b6dee841e6f51f1ad6a9157757'
	)
else
	sha256sums=(
		'e82566e56c1872c32f4f2fec4751476455bd06251794eb88dcbbe5cb37b0c647'
		'ca96b85750a0592208facc747bbe1eb22b0a35b6dee841e6f51f1ad6a9157757'
	)
fi

package() {
	cd "$srcdir"
	install -Dm644 "$pkgname/license-eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	mkdir "$pkgdir/opt"
	cp -r "$pkgname" "$pkgdir/opt/"
}
