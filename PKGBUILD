# Maintainer: u0_a266 <cagf2emv@anonaddy.me>
pkgname=fzpac-git
_pkgname=fzpac
pkgver=r97.932773c
pkgrel=2
pkgdesc="Arch Linux (pacman) package finder with fzf "
arch=("any")
url="https://github.com/sheepla/fzpac"
license=('MIT')
depends=("fzf" "pacman")
optdepends=('bash-completion: completion for bash')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"
	export DESTDIR="$pkgdir"
	PREFIX=/usr make install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENCE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}

