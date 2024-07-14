# Maintainer: VCalV

_pkgname=keybase-completion
_gituser=jhazelwo
pkgname=keybase-bash-completion-git
pkgdesc="Bash completion for keybase CLI"
pkgver=r8.7f7d0c2
pkgrel=1
epoch=1
arch=("any")
url="https://github.com/$_gituser/$_pkgname"
license=("MIT")
makedepends=('git')
depends=("bash-completion" "keybase")
source=("git+https://github.com/$_gituser/$_pkgname")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"
	install -Dm644 keybase "$pkgdir/usr/share/bash-completion/completions/keybase"
}
