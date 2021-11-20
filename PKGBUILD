# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Bobby Burden III <bobby@brb3.org>

pkgname=torsniff-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Fetches torrents from BitTorrent network'
arch=('x86_64' 'i686')
url='https://github.com/fanpei91/torsniff'
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(
	"LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE"
	"README-$pkgver::$url/raw/v$pkgver/README.md")
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/torsniff-v$pkgver-linux-amd64")
source_i686=("$pkgname-$pkgver-i686::$url/releases/download/v$pkgver/torsniff-v$pkgver-linux-386")
sha256sums=('5e00f2a45a79c59dbbec0af80a78eae7a03ca3dee7f5ecd52e477bb26d877da8'
            'bfcc03a18b9b2761b0a8aca73e7b914e3dc4d18946eeadec4e9f21f1a65e6f0d')
sha256sums_x86_64=('7881f2a5addefe4de0002e1543f97aeab9313c6ab4bdbf2f0e09f8be25979466')
sha256sums_i686=('4f7019553986d43dc38c4c93144155674652d8bdc044afc8c1e7960da8dda865')

package() {
	install -D "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/torsniff"
	install -Dm 644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 "README-$pkgver" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
