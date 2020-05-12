# Maintainer: Thomas Hudson <thomas@gthudson.xuz>
pkgname=bibman-git
pkgver=0.3.0.alpha.r8.gc8082bd
pkgrel=1
epoch=
pkgdesc="A console tool for managing BibTeX files. "
arch=(x86_64)
url="https://github.com/maciejjan/bibman"
license=('GPL')
depends=(perl perl-curses perl-text-bibtex ncurses)
makedepends=(git make)
provides=(bibman)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
      cd bibman
      git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
	cd bibman
        perl Makefile.PL
	make
}

package() {
	cd bibman
	make DESTDIR="$pkgdir/" install
}
