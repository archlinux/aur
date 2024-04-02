# Maintainer: Arti Zirk <arti.zirk@gmail.com>

_pkgname="aptly-zsh-completion"
pkgname="${_pkgname}-git"
pkgver=r18.8aff6674ac30
pkgrel=2
pkgdesc="ZSH completion for aptly"
arch=('any')
url="https://github.com/steinymity/aptly-zsh"
license=('MIT')
depends=('zsh')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+https://github.com/steinymity/aptly-zsh")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm644 _aptly "$pkgdir/usr/share/zsh/site-functions/_aptly"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
