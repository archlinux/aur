# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor:  benutzer193 <registerbn+arch a_t gmail d_ot com>

pkgname=flips-git
pkgver=r201.e7459ca
pkgrel=1
pkgdesc="A patcher for IPS and BPS files (Git version)"
arch=(x86_64)
url="https://git.disroot.org/Sir_Walrus/Flips"
license=(GPL-3.0-or-later)
depends=(
  at-spi2-core
  cairo
  gcc-libs
  gdk-pixbuf2
  glibc
  glib2
  gtk3
  harfbuzz
  hicolor-icon-theme
  pango
  zlib
)
makedepends=(git)
source=("git+https://git.disroot.org/Sir_Walrus/Flips.git")
sha256sums=(SKIP)

pkgver() {
  cd Flips
  printf "r%s.%s" "$(git rev-list --count HEAD)"\
    "$(git rev-parse --short HEAD)"
}

build() {
  make CFLAGS="$CFLAGS $LDFLAGS" -C Flips
}

package() {
  make DESTDIR="${pkgdir}" -C Flips install
}
