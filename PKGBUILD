# Maintainer: ifdog <aur@ifdog.com>
pkgname=trojan-go-bin
pkgver=0.10.6
pkgrel=2
pkgdesc="A Trojan proxy written in Go."
arch=('x86_64')
url="https://github.com/p4gefau1t/trojan-go"
license=('GPL3')
optdepends=('sudo')
provides=('trojan-go')
conflicts=('trojan-go-git')
backup=('etc/trojan-go/config.json')

source=("https://github.com/p4gefau1t/trojan-go/releases/download/v${pkgver}/trojan-go-linux-amd64.zip")
sha256sums=('764480722783a6d76ed8401f6d2f1d87d8df7e60bf261f69c67eb94b77e732af')


package() {
	install -Dm 755 "$srcdir/trojan-go" "$pkgdir/usr/bin/trojan-go"
	install -Dm 644 "$srcdir/geoip.dat" "$pkgdir/usr/share/trojan-go/geoip.dat"
	install -Dm 644 "$srcdir/geoip-only-cn-private.dat" "$pkgdir/usr/share/trojan-go/geoip-only-cn-private.dat"
	install -Dm 644 "$srcdir/geosite.dat" "$pkgdir/usr/share/trojan-go/geosite.dat"
	install -Dm 644 "$srcdir/example/client.json" "$pkgdir/etc/trojan-go/config.json"
	install -Dm 644 "$srcdir/example/client.json" "$pkgdir/etc/trojan-go/client_example.json"
 	install -Dm 644 "$srcdir/example/server.json" "$pkgdir/etc/trojan-go/server_example.json"
	install -Dm 644 "$srcdir/example/trojan-go.service" "$pkgdir/usr/lib/systemd/system/trojan-go.service"
	install -Dm 644 "$srcdir/example/trojan-go@.service" "$pkgdir/usr/lib/systemd/system/trojan-go@.service"
}
