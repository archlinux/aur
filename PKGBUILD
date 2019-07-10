# Maintainer: Konstantin Burykin <burkostya@gmail.com>
pkgname=kbdlightx1
_binname=kbdlight
pkgver=0.1.2
pkgrel=1
pkgdesc="Keyboard backlight switcher for Thinkpad X1 Carbon 5gen"
arch=('x86_64')
url="https://github.com/burkostya/kbdlight"
license=('MIT')
groups=()
depends=('upower')
provides=("$_binname")
conflicts=("$_binname")
backup=()
options=('strip')
install=
source=(
	"https://github.com/burkostya/$_binname/releases/download/v$pkgver/$_binname"
	"https://raw.githubusercontent.com/burkostya/$_binname/master/LICENSE"
)
noextract=()
sha512sums=(
	'c101f9c0c83287e501eeebbf1c4a689bfa6cb5afc694136223c32a90a67745ce10047206f888905e9ca1da692821631f305f643435101ba3ddfe2a89dd5ea0c1'
	'eef3e40af37c4846476c7ecb687f1ee129612acec95d80119ad74179948dd1add2217a9701617eba68a399ce7744ca1539f96d31e7a59d48df7fc8a57b24286b'
)

build() {
	chmod +x "$srcdir/$_binname"
}

package() {
	mkdir -p "$pkgdir/usr/bin/"
	cp "$srcdir/$_binname" "$pkgdir/usr/bin/$_binname"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
