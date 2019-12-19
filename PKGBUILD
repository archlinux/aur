# Maintainer: Andrii Burkivskyi <buryk212@gmail.com>
pkgname=zsh-extract-git
_gitname=zsh-extract
pkgver=r2.85ee9a2
pkgrel=1
pkgdesc="This plugin defines a function called extract that extracts the archive file you pass it, and it supports a wide variety of archive filetypes."
arch=(any)
url=https://github.com/le0me55i/zsh-extract
license=(custom)
depends=(zsh)
makedepends=(git)
provides=(zsh-extract)
conflicts=(zsh-extract)
source=(git+https://github.com/le0me55i/zsh-extract)
install=zsh-extract-git.install
sha256sum=(SKIP)

pkgver() {
	cd "$_gitname"
	commit=$(git rev-list --count master)
	hash=$(git rev-parse --short HEAD)
	echo "r$commit.$hash"
}

package() {
	cd "$_gitname"

	install -Dm644 extract.plugin.zsh "$pkgdir"/usr/share/zsh/plugins/"$_gitname"/extract.plugin.zsh
	install -Dm644 _extract "$pkgdir"/usr/share/zsh/site-functions/_extract
	install -Dm644 README.md "$pkgdir"/usr/share/doc/"$_gitname"/README.md
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
