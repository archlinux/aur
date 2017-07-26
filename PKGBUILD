# Contributor: Andreas B. Wagner <AndreasBWagner@gmail.com>
pkgname=svg2pdf-git
pkgver=r6.301dd48
pkgrel=1
pkgdesc="Conversion of SVGs to PDFs via cairo"
arch=('i686' 'x86_64')
url="http://cairographics.org/"
license=('custom')
depends=('librsvg>=2.0' 'cairo')
makedepends=('git')
provides=('svg2pdf')
source=("$pkgname::git://people.freedesktop.org/~cworth/svg2pdf")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  make
}
package() {
  cd $pkgname
	install -Dm755 svg2pdf ${pkgdir}/usr/bin/svg2pdf
} 
# vim:set ts=2 sw=2 et:
