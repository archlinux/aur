# Maintainer: Arti Zirk <arti.zirk@gmail.com>

pkgname=aptly-zsh-completion-git
pkgver=r18.8aff667
pkgrel=1
pkgdesc="ZSH completion for aptly"
arch=('any')
url="https://github.com/steinymity/aptly-zsh"
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
source=('aptly-zsh-completion-git::git+https://github.com/steinymity/aptly-zsh')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm644 _aptly "$pkgdir/usr/share/zsh/site-functions/_aptly"
}
