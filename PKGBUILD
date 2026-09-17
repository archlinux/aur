# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
pkgname=bbk-cli
pkgver=5.1.0
pkgrel=1
pkgdesc="Command-line speed test client for Bredbandskollen"
arch=('x86_64')
url='https://gitlab.com/internetstiftelsen-oss/bredbandskollen'
license=('MIT')
source=("https://gitlab.com/internetstiftelsen-oss/bredbandskollen/-/archive/${pkgver}/bredbandskollen-${pkgver}.tar.gz")
sha256sums=('0c7d523357812ffc426ad66cd43b0c042834081206c2d340a50f5b03373634e1')

build() {

	cd "$srcdir/bredbandskollen-${pkgver}/cli"
	make

}

package() {

	install -Dm755 "$srcdir/bredbandskollen-${pkgver}/cli/bbk" "$pkgdir/usr/bin/bbk"
	install -Dm644 "$srcdir/bredbandskollen-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/bredbandskollen-${pkgver}/cli/README.md" "$pkgdir/usr/share/doc/$pkgname/README"
}
