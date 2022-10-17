# Maintainer: Nici <NicolasVontobel at protonmail dot com>
pkgname='manga-cli-git'
_pkgname='manga-cli'
pkgver=r9.a1b7cff
pkgrel=1
epoch=1
pkgdesc="Bash script for reading mangas via the terminal by scraping manganato"
arch=('any')
url="https://github.com/7USTIN/manga-cli"
license=('GPL3')
depends=('coreutils' 'curl' 'sed' 'awk' 'diffutils' 'patch' 'img2pdf' 'zathura' 'zathura-pdf-mupdf')
makedepends=('git') 
source=('git+https://github.com/7USTIN/manga-cli.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 ./manga-cli "$pkgdir/usr/bin/manga-cli"
}
