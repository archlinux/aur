# Maintainer: u0_a266 <cagf2emv@anonaddy.me>
pkgname=fzpac-git
_pkgname=fzpac
pkgver=r122.0a6f017
pkgrel=1
pkgdesc="Arch Linux (pacman) package finder with fzf "
arch=("any")
url="https://github.com/sheepla/fzpac"
license=('MIT')
depends=("fzf" "pacman")
optdepends=('bash-completion: completion support for bash'
            'zsh-completions: completion support for zsh')
source=("git+$url")
sha256sums=('SKIP')
install=$pkgname.install

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"
	PREFIX=$pkgdir/usr make install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENCE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}

