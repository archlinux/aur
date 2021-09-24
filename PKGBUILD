# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>

pkgname=zsh-abbr
pkgver=4.6.0
pkgrel=1
pkgdesc='zsh abbreviations, ported from fish and enhanced'
arch=('any')
url='https://github.com/olets/zsh-abbr'
license=('custom')
depends=('zsh')
makedepends=('git')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('837940698E0066CF8FE580695CCA124DFFF2CD60')

package() {
	cd "$pkgname-$pkgver"
	install -Dm 644 zsh-abbr{,.plugin}.zsh -t "$pkgdir/usr/share/zsh/plugins/$pkgname/"
	install -Dm 644 man/man1/abbr.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
