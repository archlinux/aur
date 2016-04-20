# Maintainer: Moritz Schönherr <moritz.schoenherr@gmail.com>

pkgname='lel-git'
pkgver=r18.d5c9d0a
pkgrel=1
pkgdesc="Viewer for farbfeld images."
url="http://git.2f30.org"
license=('custom:MIT/X Consortium')
source=("git://git.2f30.org/lel.git")
sha512sums=('SKIP')
arch=('any')
depends=('')
makedepends=('git')
conflicts=("lel")
provides=("lel")

pkgver() {
  cd "${srcdir}/lel" 
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {

  cd "${srcdir}/lel"
  make
}

package() {

  cd "${srcdir}/lel"
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

# vim:set et sw=2 sts=2 tw=80:
