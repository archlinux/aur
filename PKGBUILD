# Maintainer: nobodyinperson <nobodyinperson at posteo de>
pkgname=styli.sh-git
pkgver=r101.232f23c
pkgrel=1
pkgdesc="wallpaper switching made easy"
arch=(any)
url="https://github.com/thevinter/styli.sh"
license=('GPL')
groups=()
depends=()
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
    install -m755 -D styli.sh -t "$pkgdir"/usr/bin
}
