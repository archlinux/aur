# Maintainer: Takumi <dGFrdW9oQHR1dGEuaW8K | base64 -d>
pkgname=fzpac-git
_pkgname=fzpac
pkgver=r215.6f7adb3
pkgrel=1
pkgdesc="Arch Linux (pacman) package finder with fzf "
arch=("any")
url="https://github.com/sheepla/fzpac"
license=('MIT')
depends=("fzf" "pacman")
optdepends=('bash-completion: completion support for bash'
            'zsh-completions: completion support for zsh'
            "fish: for fish completion support"
            "yay: for AUR helper support"
            "paru: for AUR helper support"
            )
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
}

