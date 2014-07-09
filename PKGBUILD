# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=ttm_unpack
pkgver=20121203
pkgrel=1
pkgdesc="An extractor for datafiles of 'To the Moon' and other games based on the RPG Maker XP engine"
arch=('i686' 'x86_64')
url="http://davidgow.net/hacks/ttm_unpack.html"
license=('custom')
depends=('glibc')
source=("http://davidgow.net/files/ttm_unpack.c")
sha256sums=('d894c724521e29b95dd22c378ef28e4e470769c75fb8c902ce6192f542bb7804')

build () {
  # compile with our flags
  gcc $CFLAGS ttm_unpack.c $LDFLAGS -o ttm_unpack
}

package () {
  install -Dm755 ttm_unpack "$pkgdir"/usr/bin/ttm_unpack
  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  head -n 17 ttm_unpack.c > "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
