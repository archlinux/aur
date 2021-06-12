# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=image-roll-bin
_pkgname="${pkgname%-bin}"
pkgver=1.1.0
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
sha256sums=('2eb6df39b921b7fd1126b668fe6556aae4f53326d1592ca6ed4cf95cddeb3051'
            'a05b29c2d3db2d0099c21b8bd50618ae6bfdaf6bb4e92cadd94ae673eb5717c6'
            'f467767322c9b145c060081ad88e25a1d8fe2a698b3f3d44b6f69a209ed9d253'
            '4d4db2c0db6213956474759fc02959a78c08c37fa6c8441ee9c068945dd47e5e'
            'ffbd3011486b95dea9f49b3b8ac930126cbd196c8365a9cff476e3befb14ce7f'
            'a7feba1a0c138e0af036a7a68942faaf298e7315e31ed71b779097e7158cdeac')

package() {
	install -Dvm 755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
	install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm 644 com.github.weclaw1.ImageRoll.desktop -t "$pkgdir/usr/share/applications/"
	install -Dvm 644 com.github.weclaw1.ImageRoll.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	install -Dvm 644 com.github.weclaw1.ImageRoll.metainfo.xml -t "$pkgdir/usr/share/metainfo/"
}
