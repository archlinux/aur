# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
pkgname=bbk-cli
pkgver=1.2
pkgrel=1
pkgdesc="Measurement client for Bredbandskollen"
arch=('x86_64')
url='https://www.bredbandskollen.se/en/bredbandskollen-cli'
license=('GPL2')
makedepends=('gnutls')
source=("https://github.com/dotse/bbk/archive/refs/tags/BBK_CLI_${pkgver}.tar.gz" "https://frontend.bredbandskollen.se/download/README.txt")
sha256sums=('dff38d1226844642891afcd869bfce2b9d0414c9507bacf156fb5849ab2ae8c5'
            '525254138b2dd44c810d5d31b1846dd2395eb6353c5f32805079da60a2f36ada')

build() {

	cd "$srcdir/bbk-BBK_CLI_${pkgver}/src/cli"
	make clean
	make GNUTLS=1
}

package() {

	install -Dm755 "$srcdir/bbk-BBK_CLI_${pkgver}/src/cli/cli" "$pkgdir/usr/bin/bbk_cli"	
	install -Dm644 "$srcdir/bbk-BBK_CLI_${pkgver}/src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/README.txt" "$pkgdir/usr/share/doc/$pkgname/README"
}
