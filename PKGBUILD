# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=fzfm-git
pkgver=r20.f4fe8fb
pkgrel=1
pkgdesc="A command-line fuzzy finder file manager"
arch=('any')
url="https://github.com/ashish0kumar/fzfm"
license=('MIT')
depends=('bash' 'fzf' 'file')
makedepends=('git')
optdepends=('neovim: open text files in nvim' 'xdg-utils: open other files with xdg-open')
provides=('fzfm')
conflicts=('fzfm')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "fzfm"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "fzfm"
	install -Dm755 fzfm "$pkgdir/usr/bin/fzfm"
	install -Dm644 README.md "$pkgdir/usr/share/doc/fzfm/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
