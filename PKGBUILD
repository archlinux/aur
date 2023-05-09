# Maintainer: Maciej Łoziński <maciej@robotix-lozinski.pl>
pkgname="red-nightly-bin"
pkgver=r4444.08may23.652d66a4f
pkgrel=1
pkgdesc="Red is a next-generation programming language strongly inspired by Rebol"
arch=(x86_64)
url="https://www.red-lang.org"
license=('custom:BSD-3-Clause' 'custom:BSL-1.0')
depends=(lib32-curl)
makedepends=(wget)
optdepends=(
	'openssh: for X11 forwarding on headless machines'
	'xorg-xhost: for X11 forwarding on headless machines'
	'xorg-xauth: for X11 forwarding on headless machines')
provides=(red)
conflicts=(red ed)
options=(!strip)
source=(
	"https://static.red-lang.org/dl/auto/linux/red-08may23-652d66a4f"
	"https://raw.githubusercontent.com/red/red/master/BSL-License.txt"
	"https://raw.githubusercontent.com/red/red/master/BSD-3-License.txt")
sha256sums=(
	'2db3039df8cd8f398292ab690046705f00fcc5230fc80c89d6f0c96c54c0959d'
	'c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566'
	'e64d257131093ad15b757d19181e02e3a48a2cccabe14aebf153e91a5a3735a8')


package() {
	cd "$srcdir"

	install -Dm755 red-08may23-652d66a4f "$pkgdir/usr/bin/red"

	install -dm755 "${pkgdir}/usr/share/licenses/$pkgname"
	install -Dm644 BSL-License.txt "$pkgdir/usr/share/licenses/$pkgname/BSL-License.txt"
	install -Dm644 BSD-3-License.txt "$pkgdir/usr/share/licenses/$pkgname/BSD-3-License.txt"
}
