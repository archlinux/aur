# Maintainer: martoko <mbastholm at gmail dot com>

pkgname=riichi-city
pkgver=2.0.0
pkgrel=1
pkgdesc='Riichi City is a competitive urban-style Anime mahjong game.'
url='https://www.mahjong-jp.com'
license=('custom')
arch=('x86_64')
depends=('libsecret')
source=(https://d3qgi0t347dz44.cloudfront.net/release/linuxpack/Linux_default_$pkgver.zip
        https://www.mahjong-jp.com/static/img/common/termsofService_en.png)
sha256sums=('2f1eb475c9bdd60bab843458510ce6abf4cf957f740b66f9caf1dec16ffea135'
            '20983b5d5ed2dc4cfd6043f7f36eff2314be3e0e1664105fc2cb1301d2c3ddfd')

package() {
	chmod +x "Linux_default_$pkgver/Mahjong-JP.x86_64"

	mkdir -p "$pkgdir/opt"
	cp -r "$srcdir/Linux_default_$pkgver" "$pkgdir/opt/riichi-city"
	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/riichi-city/Mahjong-JP.x86_64 "$pkgdir/usr/bin/$pkgname"

	install -Dm644 termsofService_en.png "$pkgdir/usr/share/licenses/$pkgname/LICENSE.png"
}
