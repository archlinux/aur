# Maintainer: Ryan Medeiros <lofenyy@linuxmail.org>
pkgname='librewands'
pkgver=0.0.3
pkgrel=1
pkgdesc="Map editor for a collaboratively made ncurses RPG featuring magick and monsters."
arch=(any)
url="https://gitea.com/lofenyy/LibreWands"
license=('GPL')
groups=()
depends=('ncurses')
makedepends=('make' 'gcc')
optdepends=('imagemagick' 'librsvg2' 'texlive')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://gitea.com/lofenyy/$pkgname/archive/$pkgver.tar.gz)
noextract=()
md5sums=('73b9d5b70f14ea4d10e86d79854e5a9d') #autofill using updpkgsums

prepare() {
  tar -xf $pkgver.tar.gz
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
}
