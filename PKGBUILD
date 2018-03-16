# Maintainer: Mattias Giese <mattiasgiese@posteo.net>

_pkgname=keybase-completion
pkgname=keybase-bash-completion
pkgdesc="Bash completion for keybase CLI"
pkgver=r12.6a59dad
pkgrel=1
arch=("any")
url="https://github.com/dtiersch/keybase-completion"
license=("MIT")
makedepends=('git')
depends=("bash-completion" "keybase")
source=('git+https://github.com/dtiersch/keybase-completion')
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"
	install -Dm644 keybase "$pkgdir/usr/share/bash-completion/completions/keybase"
}
