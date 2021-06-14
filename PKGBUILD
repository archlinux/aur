# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=image-roll-bin
_pkgname="${pkgname%-bin}"
pkgver=1.1.1
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
        "https://raw.githubusercontent.com/weclaw1/$_pkgname/$pkgver/README.md"
        "https://raw.githubusercontent.com/weclaw1/$_pkgname/$pkgver/src/resources/com.github.weclaw1.ImageRoll.desktop"
        "https://raw.githubusercontent.com/weclaw1/$_pkgname/$pkgver/src/resources/com.github.weclaw1.ImageRoll.svg"
        "https://raw.githubusercontent.com/weclaw1/$_pkgname/$pkgver/src/resources/com.github.weclaw1.ImageRoll.metainfo.xml"
)
sha256sums=('71aa79baa75ab76b677214b47f8eae16c94dd3cd4fc9d8fee93d58c59230db30'
            'a05b29c2d3db2d0099c21b8bd50618ae6bfdaf6bb4e92cadd94ae673eb5717c6'
            '611335d0701dc46409e3db93b26a45b4ed2840d63941415bc2c46721d353e1e6'
            '4d4db2c0db6213956474759fc02959a78c08c37fa6c8441ee9c068945dd47e5e'
            'dd12fa3d3f4c4d64d4c1cdf99fef48b098a6ea069400b4863144f81a4dc8e010'
            'fad8de7d6462df9196f5b49ee2ce0836f54891bc574f1b0e86dd8c519db30e0a')

package() {
	install -Dvm 755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm 644 com.github.weclaw1.ImageRoll.desktop -t "$pkgdir/usr/share/applications/"
	install -Dvm 644 com.github.weclaw1.ImageRoll.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	install -Dvm 644 com.github.weclaw1.ImageRoll.metainfo.xml -t "$pkgdir/usr/share/metainfo/"
}
