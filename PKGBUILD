# Maintainer: martoko <mbastholm at gmail dot com>

pkgname=riichi-city
pkgver=2.0.1
pkgrel=1
pkgdesc='Riichi City is a competitive urban-style Anime mahjong game.'
url='https://www.mahjong-jp.com'
license=('custom')
arch=('x86_64')
depends=('libsecret')
source=(https://d3qgi0t347dz44.cloudfront.net/release/linuxpack/default_prod_Linux_$pkgver.zip
        https://www.mahjong-jp.com/static/img/common/termsofService_en.png)
sha256sums=('c351f01fbb2ef2ec70d4cf29961155d25e27b2e59c89c2961bd298e3d61c02f2'
            '20983b5d5ed2dc4cfd6043f7f36eff2314be3e0e1664105fc2cb1301d2c3ddfd')

package() {
	chmod +x "default_prod_Linux_$pkgver/Mahjong-JP.x86_64"

	mkdir -p "$pkgdir/opt"
	cp -r "$srcdir/default_prod_Linux_$pkgver" "$pkgdir/opt/riichi-city"
	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/riichi-city/Mahjong-JP.x86_64 "$pkgdir/usr/bin/$pkgname"

	install -Dm644 termsofService_en.png "$pkgdir/usr/share/licenses/$pkgname/LICENSE.png"
}
