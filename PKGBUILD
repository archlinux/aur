# Maintainer: Daniel Kuehn <daniel@kuehn.foo>
pkgname=wordgen
pkgver=1.0.1
pkgrel=2
pkgdesc="Bash script to print random words using the EFF large wordlist."
arch=('any')
url="https://codeberg.org/daniel-kuehn/$pkgname"
license=('GPL-3.0-or-later')
depends=('bash'
         'coreutils')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('5b9fc2ce1ec4199f3dd2709362ce46c95559f6c8e61fab03c18edacc13345193')

package()
{
	cd "$srcdir/$pkgname"

	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "man/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
	install -Dm644 "eff_large.wordlist" "$pkgdir/usr/share/$pkgname/wordlists/eff_large.wordlist"
}
