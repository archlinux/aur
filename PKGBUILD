# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
pkgname=bbk-cli
pkgver=1.2.1
pkgrel=1
pkgdesc="Measurement client for Bredbandskollen"
arch=('x86_64')
url='https://www.bredbandskollen.se/en/bredbandskollen-cli'
license=('custom')
makedepends=('gnutls')
source=("https://github.com/dotse/bbk/archive/refs/tags/BBK_CLI_${pkgver}.tar.gz" "https://frontend.bredbandskollen.se/download/README.txt")
sha256sums=('599415f508ad1e31cb8d33742bcc3cb03f4904ac98bdee77e2e0cb92f35c6fc2'
            '525254138b2dd44c810d5d31b1846dd2395eb6353c5f32805079da60a2f36ada')

build() {

	cd "$srcdir/bbk-BBK_CLI_${pkgver}/src/cli"
	make clean
	make GNUTLS=1
}

package() {

	install -Dm755 "$srcdir/bbk-BBK_CLI_${pkgver}/src/cli/cli" "$pkgdir/usr/bin/bbk_cli"	
	install -Dm644 "$srcdir/bbk-BBK_CLI_${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/README.txt" "$pkgdir/usr/share/doc/$pkgname/README"
}
