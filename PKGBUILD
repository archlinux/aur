# Maintainer: Nici <NiciTheNici at protonmail dot com>
pkgname='manga-cli-git'
_pkgname='manga-cli'
pkgver=r6.3a08894
pkgrel=1
epoch=1
pkgdesc="A Bash script for reading mangas via the terminal by scraping Mangakakalot."
arch=('any')
url="https://github.com/7USTIN/manga-cli"
license=('GPL3')
depends=('coreutils' 'curl' 'sed' 'awk' 'diffutils' 'patch' 'imagemagick' 'zathura' 'zathura-pdf-mupdf')
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
