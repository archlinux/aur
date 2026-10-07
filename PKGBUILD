# Maintainer: Piero <biagini93@ik.me>
pkgname=nirilayout-bin
_pkgname=nirilayout
pkgver=0.4.0
pkgrel=1
pkgdesc="Quickly switch niri output configuration between different layouts (GTK switcher, prebuilt binary)"
arch=('x86_64')
url="https://github.com/Piero-93/nirilayout"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'glib2' 'cairo' 'pango' 'gdk-pixbuf2' 'graphene' 'glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/Piero-93/nirilayout/v$pkgver/LICENSE"
        "README-$pkgver.md::https://raw.githubusercontent.com/Piero-93/nirilayout/v$pkgver/README.md")
sha256sums=('6ce70c026bc8284b32effcb7fe66bff6245f4379b50aecb4254c09001d3e4d01'
            '25f0a4e4c698ba4069be66bfda51c61ae2067ee7882d542b2f254ea3e7dce39e'
            'bce69396952f4cd274f065b4e69bd7bcb69520f299944da96c4fd73b402c941d')

package() {
	install -Dm755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
