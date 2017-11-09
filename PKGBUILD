# Maintainer: Johan Förberg <johan@forberg.se>

pkgname='gog-butcher'
pkgdesc="GOG's .sh release of the Butcher game"
pkgver=2.6.0.7
pkgrel=1
url='https://www.gog.com/game/butcher'
arch=('x86_64')
groups=('games' 'gog')
license=('unknown')
depends=(
  libglvnd
  libx11
  libxau
  libxcb
  libxcursor
  libxext
  libxfixes
  libxrandr
  libxrender
)
source=(
  gog-butcher
  "file://gog_butcher_$pkgver.sh" # Get this from gog.com
)
sha1sums=(
  'f957b58cb77aa502d8c47ef6856f9a6c247089df'
  'f82788d51b7523931cac9a0c51ce8ad85015e198'
)

package() {
  mkdir -p "$pkgdir"/opt/gog-butcher
  cp -r "$srcdir"/{data,meta,scripts} "$pkgdir"/opt/gog-butcher/

  find "$pkgdir" -type d -exec chmod 755 {} \;

  install -D -m 755 "$srcdir"/gog-butcher "$pkgdir"/usr/bin/gog-butcher
}
