# Maintainer: Stephen Brennan <smb196@case.edu>
pkgname=latex-homework-git
pkgver=r33.cf82d6f
pkgrel=2
pkgdesc="LaTeX class for homework assignments."
arch=(any)
url="https://github.com/brenns10/homework"
license=('MIT')
depends=('texlive-core')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname}.install"
source=('git://github.com/brenns10/homework.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/homework"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/homework"
        mkdir -p $pkgdir/usr/share/texmf-dist/tex/latex/homework

        install -m644 homework.cls \
                "$pkgdir/usr/share/texmf-dist/tex/latex/homework/"
}
