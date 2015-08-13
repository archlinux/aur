# Maintainer: Ramana Kumar <firstname at member.fsf.org>
pkgname=pacnews-git
pkgver=r1062.1a83f29
pkgrel=1
pkgdesc="Find .pacnew files and merge them with vimdiff"
arch=(any)
url="https://github.com/pbrisbin/dotfiles/blob/master/tag-scripts/local/bin/pacnews"
license=('unknown')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/pbrisbin/dotfiles.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/dotfiles"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/dotfiles/tag-scripts/local/bin"
  mkdir -p "$pkgdir/usr/bin"
  install ${pkgname%-git} "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
