# Maintainer: Emilio Reggi <nag@mailbox.org>
pkgname=bombadillo-git
_pkgname=bombadillo
pkgver=r274.ce3744a
pkgrel=1
pkgdesc="Bombabillo is a non-web client for the terminal, supporting Gopher, Gemini and much more."
arch=('x86_64')
url="https://tildegit.org/sloum/bombadillo.git"
license=('GPL')
groups=()
depends=()
makedepends=('go' 'git')
optdepends=('desktop-file-utils: create desktop entry')
source=('bombadillo::git+https://tildegit.org/sloum/bombadillo.git')
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make PREFIX=/usr
}

package() {
	cd "$_pkgname"
	make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX=/usr install
}
