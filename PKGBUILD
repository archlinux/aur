# Maintainer: Carlos Marchal <carlos.marchal@pm.me>
pkgname=lambda-tunnel
pkgver=3.1.9
pkgrel=1
pkgdesc="Lambdatest tunnel for testing local sites"
arch=('x86_64')
url="https://www.lambdatest.com"
license=('unknown')
source=("https://downloads.lambdatest.com/tunnel/v3/linux/64bit/LT_Linux.zip"
	"lambda-tunnel.yaml"
	"lambda-tunnel.service")

sha256sums=('SKIP'
	    '3091da011fe4b05211c8615818b9035e2e2b7800d73fd8125da01c68fb62346d'
	    'a8e9bef00c296c402e7d9f9e2d7368bfcee24c44c4d8a5e946c98ad9696dc321')

pkgver() {
	./LT --version | sed 's/LT version //'
}

package() {
	cd "$pkgdir"
	install -D -m755 "$srcdir"/LT usr/bin/LT
	install -D -m644 "$srcdir"/lambda-tunnel.yaml etc/lambda-tunnel.yaml
	install -D -m644 "$srcdir"/lambda-tunnel.service usr/lib/systemd/system/lambda-tunnel.service
}
