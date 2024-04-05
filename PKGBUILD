# Maintainer: Maciej Łoziński <maciej@robotix-lozinski.pl>
pkgname="red-nightly-bin"
pkgver=r4777.05apr24.9516a4b66
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
_filename="red-05apr24-9516a4b66"
source=(
	"https://static.red-lang.org/dl/auto/linux/$_filename"
	"https://raw.githubusercontent.com/red/red/master/BSL-License.txt"
	"https://raw.githubusercontent.com/red/red/master/BSD-3-License.txt")
sha256sums=(
	'5382969815fd43faf3a19cd85f2750571c4885235535e87bb2762a92d2528d8a'
	'c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566'
	'e64d257131093ad15b757d19181e02e3a48a2cccabe14aebf153e91a5a3735a8')


package() {
	cd "$srcdir"

	install -Dm755 "$_filename" "$pkgdir/usr/bin/red"

	install -dm755 "${pkgdir}/usr/share/licenses/$pkgname"
	install -Dm644 BSL-License.txt "$pkgdir/usr/share/licenses/$pkgname/BSL-License.txt"
	install -Dm644 BSD-3-License.txt "$pkgdir/usr/share/licenses/$pkgname/BSD-3-License.txt"
}
