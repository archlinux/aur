# Maintainer: Craig <fast dot code dot studio at gmail dot com>

pkgname=grits-git
provides=('grits')
pkgver=0.9.0.r10
pkgrel=1
pkgdesc="Virtual Globe library using GTK+ and OpenGL"
arch=('aarch64' 'x86_64')
url="http://pileus.org/aweather/grits"
license=('GPL3')
depends=('gtk2' 'libsoup' 'libglvnd' 'glu' 'glew')
makedepends=('gtk-doc')
options=('!libtool')
source=('git+https://github.com/i3Craig/grits.git')
sha512sums=('SKIP')

# Generate a version number based on the number of commits to the default branch.
pkgver() {
  cd grits
  printf "0.9.0.r%s" "$(git rev-list --count HEAD)"
}

prepare() {
  cd grits
   ./configure --prefix=/usr LIBS=-lgmodule-2.0
}

build() {
  cd grits
  make
}

package() {
  cd grits
  make DESTDIR="${pkgdir}" install
}
