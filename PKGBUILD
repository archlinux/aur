# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>

_pkgname=kimg
pkgname=kimg
pkgver=0.2.1
pkgrel=2
pkgdesc='Image converter for the KnightOS image format (kimg)'
groups=("knightos")
url='http://github.com/KnightOS/kimg'
license=('MIT')
source=("git+https://github.com/KnightOS/kimg#tag=${pkgver}")
sha256sums=('SKIP')
arch=('i686' 'x86_64')
depends=('imagemagick')
makedepends=('asciidoc' 'cmake' 'git')

build() {
  cd "${srcdir}/${_pkgname}"

  # Configure project.
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  # Build it!
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install the program.
  DESTDIR="${pkgdir}/" make install
}

# vim: ft=sh ts=2 sw=2 et
