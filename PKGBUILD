# Maintainer: Bart Libert <bart plus aur at libert dot email>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Isaac Freund <ifreund@ifreund.xyz>

pkgname=zsh-abbr
pkgver=5.2.0
pkgrel=1
_commit=6802d73
pkgdesc=' The zsh manager for auto-expanding abbreviations, inspired by fish shell. '
arch=('any')
url='https://github.com/olets/zsh-abbr'
license=('custom')
depends=('zsh')
makedepends=('git')
changelog=CHANGELOG.md
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('4EC9BDBB2A18353E1EE419B4F451207093085604') # Henry Bley-Vroman

package() {
	cd "$pkgname"
	install -Dvm644 zsh-abbr{,.plugin}.zsh -t "$pkgdir/usr/share/zsh/plugins/$pkgname/"
	install -Dvm644 man/man1/abbr.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
