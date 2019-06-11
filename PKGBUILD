# Maintainer: José Cleiton <jcleitonbc@gmail.com>
pkgname='scbd-git'
_gitname='book-downloader'
_pkgname='scbd'
pkgver=r57.db66796
pkgrel=1
pkgdesc='Simple C Book Downloader, also create a reference file for LaTeX (.bib)'
arch=('any')
url='https://github.com/josecleiton/book-downloader'
license=('MIT')
source=('git+https://github.com/josecleiton/book-downloader')
md5sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "$srcdir/$_gitname/src"
   make PREFIX=/usr DESTDIR="${pkgdir}" install
	 install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	 install -Dm644 "../README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
