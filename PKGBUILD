# Maintainer: Gerard de Leeuw <gdeleeuw at leeuwit dot nl>

pkgname=hws
pkgver=3.1.00
pkgrel=4
pkgdesc="Hardware Sentry"
arch=("x86_64")
url="https://www.sentrysoftware.com/docs/hws-doc/${pkgver}/index.html"
license=("custom")
source=("https://w3s.link/ipfs/bafybeiai6vgnd5z2lgyrjbq2luvhbxcihlmbr67dtsdrt6wpsylm5z7ftu/hws-debian-3.1.00-amd64.deb")
md5sums=("921951cf1aa02107499642a78b5adeb4")

package() {
	tar -xf data.tar.xz -C "${pkgdir}"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/bin"
    install -Dm644 "$pkgdir/opt/hws/lib/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	mv "$pkgdir/lib" "$pkgdir/usr/lib"
	ln -s /opt/hws/bin/hws ${pkgdir}/usr/bin/hws
}
