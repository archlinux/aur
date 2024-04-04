# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=wordgen
pkgver=1.0.0
pkgrel=1
pkgdesc="Bash script to print random words using the EFF large wordlist."
arch=('any')
url="https://codeberg.org/daniel-kuehn/$pkgname"
license=('GPL-3.0-or-later')
depends=('bash'
         'coreutils')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('04123bb771d2d1ed65a5c496a499b36a80afa51f291089f3489490e9fd12d7d4')

package()
{
	cd "$srcdir/$pkgname"

	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "man/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
	install -Dm644 "eff_large.wordlist" "$pkgdir/usr/share/$pkgname/wordlists/eff_large.wordlist"
}
