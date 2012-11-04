# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=prince
pkgver=1
pkgrel=1
pkgdesc="Prince of Persia adventure game (for dosbox)"
arch=(any)
url="http://unknown/"
license=('unknown')
depends=(dosbox)
makedepends=(unzip)
source=(prince
        "prince.zip::http://www.abzone.be/downloads/apps/gam_PoP_vxx.zip")
noextract=("prince.zip")
sha256sums=('c431d88d1486fcd5c3c26e67571e86f3d65a3f4bfdff0ac4f1b372a7a4070308'
            '5bd534f8fae481b37e388a952c5c7aeb73afa31ab748443c558edf39783388ec')

build() {
  mkdir -p "$srcdir/princedir"
  cd "$srcdir/princedir/"
  bsdtar xf "$srcdir/prince.zip"
}

package() {
  install -Dm755 "$srcdir/prince" "$pkgdir/usr/bin/prince"
  install -dm755 "$pkgdir/usr/share"
  cp -r "$srcdir/princedir/" "$pkgdir/usr/share/prince"
  find "$pkgdir/usr/share/prince/" -type f -exec chmod 644 "{}" \;
}

# vim:set ts=2 sw=2 et:
