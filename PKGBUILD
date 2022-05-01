# Maintainer: <abishekj274@gmail.com>
pkgname=peer2profit
pkgver=0.22
pkgrel=1
pkgdesc='An app to sell your unused bandwidth'
arch=('x86_64')
url="https://peer2profit.io/"
license=("custom:peer2profit")
source=("https://updates.peer2profit.app/peer2profit_${pkgver}_amd64.deb" "https://peer2profit.io/user-agreement")
sha256sums=('180055f83ca4b793ee82044d50fd4079a4a495c01be5c2fa9efe1292d4fc70e0'
            'dcbf1cbf7237e6e4957a141729707d3991ad8c104e00bc3051f5aae30b9100ff')
depends=("libxkbcommon" "libglvnd" "hicolor-icon-theme")

package(){
	cd $srcdir
	tar xpf data.tar.xz -C $pkgdir
	install -Dm644 "$srcdir/user-agreement" "$pkgdir/usr/share/licenses/$pkgname/user-agreement.html"
	rm -rf "$pkgdir/usr/local"
}
