# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=fzf-git.sh-git
pkgver=r100.110c0a1
pkgrel=1
pkgdesc="bash and zsh key bindings for Git objects, powered by fzf"
arch=('any')
url="https://github.com/junegunn/fzf-git.sh"
license=('MIT')
depends=('fzf' 'git')
optdepends=('bat: file previews' 'tmux: tmux key bindings')
provides=('fzf-git.sh')
conflicts=('fzf-git.sh')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "fzf-git.sh"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "fzf-git.sh"
	install -Dm644 fzf-git.sh "$pkgdir/usr/share/fzf-git/fzf-git.sh"
	install -Dm644 fzf-git.fish "$pkgdir/usr/share/fzf-git/fzf-git.fish"
	install -Dm644 fzf-git.tmux "$pkgdir/usr/share/fzf-git/fzf-git.tmux"
	install -Dm644 README.md "$pkgdir/usr/share/doc/fzf-git.sh/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
