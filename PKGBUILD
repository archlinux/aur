# Maintainer: nytpu <alex at nytpu dot com>

pkgname=aether-bin
_progname=Aether
pkgver=2.0.0_dev.15
_buildid=2011262249.19338c93
pkgrel=1
pkgdesc="Peer-to-peer ephemeral public communities"
arch=(any)
license=('AGPL')
url="https://github.com/nehbit/aether"
depends=('gtk3' 'nss')
source=("https://static.getaether.net/Releases/$_progname-${pkgver//_/-}/$_buildid/linux/$_progname-${pkgver//_/-}%2B$_buildid.tar.gz"
        "https://raw.githubusercontent.com/nehbit/${pkgname%%-bin}/master/${pkgname%%-bin}-core/${pkgname%%-bin}/client/src/app/ext_dep/images/Logo-lg.png"
        "aether.desktop")
sha256sums=('c7d50891f10e56846c1baf45cddf91d040bf26d4c254f1be8f6c50f507e228c2'
            'a844669cf6aeca6b28bbd77fa1163ed774899054563d77c087570980c812bd5d'
            'f1e54ee1e9f04f0b6c39b0bb42f447403c5be122a6ad361f8d4ff65559c98636')

package() {
	install -d "$pkgdir/opt/"
	install -d "$pkgdir/usr/bin/"
	install -d "$pkgdir/usr/share/applications/"
	install -d "$pkgdir/usr/share/pixmaps/"

	cp -r "$srcdir/$_progname-${pkgver//_/-}+$_buildid/" "$pkgdir/opt/$_progname"
	ln -s "/opt/$_progname/AetherP2P" "$pkgdir/usr/bin/${pkgname%%-bin}"
	install -Dm644 "Logo-lg.png" "$pkgdir/usr/share/pixmaps/${pkgname%%-bin}.png"
	install -Dm644 "${pkgname%%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%%-bin}.desktop"
}

# vim: set ts=2 sw=2
