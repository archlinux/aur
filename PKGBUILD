# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>

pkgname=zsh-abbr
pkgver=4.4.0
pkgrel=1
pkgdesc='zsh abbreviations, ported from fish and enhanced'
arch=('any')
url='https://github.com/olets/zsh-abbr'
license=('MIT')
depends=('zsh')
makedepends=('git')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
# source=("$pkgname-$pkgver::git+$url#tag=v$pkgver")
sha256sums=('390affea4ea8a351660a6b8177f493ccf2674e20d73896f7b8f846670defaf5d')
# validpgpkeys=('5CCA124DFFF2CD60')

package() {
	cd "$pkgname-$pkgver"
	install -Dm 644 zsh-abbr{,.plugin}.zsh -t "$pkgdir/usr/share/zsh/plugins/$pkgname/"
	install -Dm 644 man/man1/abbr.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
