# Maintainer: Arti Zirk <arti.zirk@gmail.com>

_pkgname="keybase-zsh-completion"
pkgname="${_pkgname}-git"
pkgver=r7.8e37ebf
pkgrel=4
pkgdesc="ZSH completion for keybase"
arch=('any')
url="https://github.com/fnoris/keybase-zsh-completion"
license=('MIT')
depends=('zsh')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+https://github.com/fnoris/keybase-zsh-completion.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm644 _keybase "$pkgdir/usr/share/zsh/site-functions/_keybase"
	# Upstream repo does not contain proper LICENSE file :(
	install -Dm644 README.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
