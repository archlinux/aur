# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=image-roll-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple and fast GTK image viewer with basic image manipulation tools"
arch=('x86_64')
url="https://github.com/weclaw1/image-roll"
license=('MIT')
depends=('gtk3')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver"
        "https://raw.githubusercontent.com/weclaw1/$_pkgname/$pkgver/LICENSE"
        "https://raw.githubusercontent.com/weclaw1/$_pkgname/$pkgver/README.md")
sha256sums=('4a76fe29417eb7216e72ba2ed87f23f77b49c8716b691134dbfb334d6e502330'
            'a05b29c2d3db2d0099c21b8bd50618ae6bfdaf6bb4e92cadd94ae673eb5717c6'
            '09d03984477163d3831a80c9bb1009db1d0e85c03330691ee7a04e2043da8eb2')

package() {
	install -Dvm 755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
