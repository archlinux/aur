# Maintainer: Arti Zirk <arti.zirk@gmail.com>

pkgname=keybase-zsh-completion-git
pkgver=r5.4ec76d5
pkgrel=1
pkgdesc="ZSH completion for keybase"
arch=('any')
url="https://github.com/fnoris/keybase-zsh-completion"
license=('MIT')
groups=()
depends=('zsh')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=('keybase-zsh-completion-git::git+https://github.com/fnoris/keybase-zsh-completion.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm644 _keybase "$pkgdir/usr/share/zsh/site-functions/_keybase"
}
