# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>

pkgname=zsh-abbr
pkgver=4.7.0
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
validpgpkeys=('4EC9BDBB2A18353E1EE419B4F451207093085604') # Henry Bley-Vroman

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 zsh-abbr{,.plugin}.zsh -t "$pkgdir/usr/share/zsh/plugins/$pkgname/"
	install -Dm644 man/man1/abbr.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
