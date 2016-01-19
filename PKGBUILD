# Maintainer: Semyon Maryasin <marsoft@ya.ru>

pkgname=z
pkgver=1.9
pkgrel=1
pkgdesc="Tracks your most used directories, based on 'frecency'"
arch=('any')
url="https://github.com/rupa/z/"
license=('WTFPL')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/rupa/$pkgname/tar.gz/v$pkgver")
sha256sums=('e2860e4f65770e02297ca4ca08ec1ee623a658bd9cc1acddbbe5ad22e1de70a7')
install=z.install

package() {
	cd "$srcdir/$pkgname-$pkgver"

	msg2 'Installing man page...'
	# update path in manpage
	sed -i z.1 -e "s:/path/to/z.sh:/usr/share/$pkgname/z.sh:g"
	install -Dm 644 z.1 "$pkgdir/usr/share/man/man1/z.1"

	msg2 'Installing...'
	install -Dm 644 z.sh "$pkgdir/usr/share/$pkgname/z.sh"
}
