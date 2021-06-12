# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=image-roll-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.0
pkgrel=2
pkgdesc="A simple and fast GTK image viewer with basic image manipulation tools"
arch=('x86_64')
url="https://github.com/weclaw1/image-roll"
license=('MIT')
depends=('gtk3')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver"
        "https://raw.githubusercontent.com/weclaw1/$_pkgname/$pkgver/LICENSE"
        "https://raw.githubusercontent.com/weclaw1/$_pkgname/$pkgver/README.md"
        "https://raw.githubusercontent.com/weclaw1/$_pkgname/$pkgver/src/resources/com.github.weclaw1.ImageRoll.desktop"
        "https://raw.githubusercontent.com/weclaw1/$_pkgname/$pkgver/src/resources/com.github.weclaw1.ImageRoll.svg"
        "https://raw.githubusercontent.com/weclaw1/$_pkgname/$pkgver/src/resources/com.github.weclaw1.ImageRoll.metainfo.xml"
)
sha256sums=('4a76fe29417eb7216e72ba2ed87f23f77b49c8716b691134dbfb334d6e502330'
            'a05b29c2d3db2d0099c21b8bd50618ae6bfdaf6bb4e92cadd94ae673eb5717c6'
            '09d03984477163d3831a80c9bb1009db1d0e85c03330691ee7a04e2043da8eb2'
            'ac118a1e195e14bcdfa54cbc1cd0b035660ba97f4c41de215b86035f0d5b8ffc'
            'ffbd3011486b95dea9f49b3b8ac930126cbd196c8365a9cff476e3befb14ce7f'
            '66f5560a3f9ab03830e4057fa63e7c99ccd144c725476bd8f5c7b42edc5b1e5e')

package() {
	install -Dvm 755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm 644 com.github.weclaw1.ImageRoll.desktop -t "$pkgdir/usr/share/applications/"
	install -Dvm 644 com.github.weclaw1.ImageRoll.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	install -Dvm 644 com.github.weclaw1.ImageRoll.metainfo.xml -t "$pkgdir/usr/share/metainfo/"
}
