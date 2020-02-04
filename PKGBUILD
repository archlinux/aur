# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=hpmor-man-pages-git
pkgver=r21.33a25ea
pkgrel=1
provides=('hpmor-man-pages')
makedepends=('go-md2man' 'pandoc' 'python')
arch=('any')
pkgdesc="Harry Potter and the Methods of Rationality, Unix Man Page Edition"
license=('unknown')
url="https://github.com/io12/hpmor-man-pages"
source=("git+https://github.com/io12/hpmor-man-pages")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/hpmor-man-pages"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/hpmor-man-pages"
  make
}

package() {
  cd "$srcdir/hpmor-man-pages"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
