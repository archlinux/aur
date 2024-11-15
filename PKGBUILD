# Maintainer: ptchinster <AT> gmail.com

pkgname=latex-listings-rust-git
_gitpkgname="${pkgname%-git}"
_gitpkgname="${_gitpkgname#latex-}"
pkgver=r8.d52a3d9
pkgrel=1
pkgdesc="A Rust language and style specification for the LaTeX-package listings"
arch=('any')
url="https://github.com/denki/listings-rust"
license=('BSD')
groups=()
depends=('texlive-core')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git+${url}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "${_gitpkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_gitpkgname}"
	install -m 755 -d $pkgdir/usr/share/texmf-dist/tex/latex/listings-rust
	install -m 644 listings-rust.sty $pkgdir/usr/share/texmf-dist/tex/latex/listings-rust
}

