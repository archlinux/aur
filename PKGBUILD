# Maintainer: Josh Klar <j@iv597.com>
pkgname=git-staredown-git
pkgver=r4.50f2f27
pkgrel=1
pkgdesc="A utility to find which GitHub pull requests have been associated with a file"
arch=(any)
url="https://github.com/iv597/git-staredown"
license=("MIT")
groups=()
depends=("python-pygit2" "python-github3")
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/iv597/git-staredown.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare() {
#	cd "$srcdir/${pkgname%-git}"
#	patch -p1 -i "$srcdir/${pkgname%-git}.patch"
#}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -m0755 git-staredown.py "${pkgdir}/usr/bin/git-staredown"
}
