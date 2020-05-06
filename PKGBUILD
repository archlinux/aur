# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
pkgname=bbk-cli
pkgver=1.0
pkgrel=1
pkgdesc="Measurement client for Bredbandskollen"
arch=('x86_64')
url='https://www.bredbandskollen.se/en/bredbandskollen-cli'
license=('GPL2')
makedepends=('git' 'gnutls')
source=("git+https://github.com/dotse/bbk.git#commit=7b810a6"
"https://frontend.bredbandskollen.se/download/README.txt")
sha256sums=('SKIP'
            '525254138b2dd44c810d5d31b1846dd2395eb6353c5f32805079da60a2f36ada')

build() {

	cd "$srcdir/bbk/src/cli"
	make clean
	make GNUTLS=1
}

package() {

	install -Dm755 "$srcdir/bbk/src/cli/cli" "$pkgdir/usr/bin/bbk_cli"	
	install -Dm644 "$srcdir/bbk/src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/README.txt" "$pkgdir/usr/share/doc/$pkgname/README"
}
