# Maintainer: Maciej Łoziński <maciej@robotix-lozinski.pl>
pkgname="red-nightly-bin"
pkgver=r4326.09jan23.c7ceccff1
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
	"https://static.red-lang.org/dl/auto/linux/red-09jan23-c7ceccff1"
	"https://raw.githubusercontent.com/red/red/master/BSL-License.txt"
	"https://raw.githubusercontent.com/red/red/master/BSD-3-License.txt")
sha256sums=(
	'04a6bb3ec0cdc0b900875584fda2de1547df747f12df4596c65558486063a377'
	'c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566'
	'e64d257131093ad15b757d19181e02e3a48a2cccabe14aebf153e91a5a3735a8')


package() {
	cd "$srcdir"

	install -Dm755 red-09jan23-c7ceccff1 "$pkgdir/usr/bin/red"

	install -dm755 "${pkgdir}/usr/share/licenses/$pkgname"
	install -Dm644 BSL-License.txt "$pkgdir/usr/share/licenses/$pkgname/BSL-License.txt"
	install -Dm644 BSD-3-License.txt "$pkgdir/usr/share/licenses/$pkgname/BSD-3-License.txt"
}
