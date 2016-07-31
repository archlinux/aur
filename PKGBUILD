# Contributor: Hinrich Harms <arch@hinrich.de>
# Contributor: sylvain alborini <sylvain.alborini@gmail.com>
# Maintainer: John Wallaby <drunken.wallaby@gmail.com>

_pkgname=gpscorrelate
pkgname=gpscorrelate-git
pkgver=r68.365f6e1
pkgrel=2
pkgdesc='GPS Photo Correlation; Writes location data to EXIF tags using GPX files (command line and GTK interface).'
url='https://github.com/freefoote/gpscorrelate'
license=('GPL')
source=('git+https://github.com/freefoote/gpscorrelate')
sha256sums=('SKIP')
arch=('any')
depends=('libxml2' 'gtk2' 'exiv2' 'libxslt')
makedepends=('git')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/${_pkgname}
  make prefix=/usr DESTDIR=$pkgdir install || return 1
}


# vim: ft=sh ts=2 sw=2 et
