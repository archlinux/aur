# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=prince
pkgver=1
pkgrel=3
pkgdesc="Prince of Persia adventure game (for dosbox)"
arch=(any)
url="http://unknown/"
license=('unknown')
depends=(dosbox)
makedepends=(unzip)
source=(princeofpersia
        "prince.zip::http://popuw.com/files/prince14.zip")
noextract=("prince.zip")
sha256sums=('c431d88d1486fcd5c3c26e67571e86f3d65a3f4bfdff0ac4f1b372a7a4070308'
            '896fa1597f5997ce9b06b3d63cc5e0c8f4f8397354d8ab0e0c7fe6fecb324ac7')

build() {
  mkdir -p "$srcdir/princedir"
  cd "$srcdir/princedir/"
  bsdtar xf "$srcdir/prince.zip"
}

package() {
  install -Dm755 "$srcdir/princeofpersia" "$pkgdir/usr/bin/princeofpersia"
  install -dm755 "$pkgdir/usr/share"
  cp -r "$srcdir/princedir/" "$pkgdir/usr/share/prince"
  find "$pkgdir/usr/share/prince/" -type f -exec chmod 644 "{}" \;
}

# vim:set ts=2 sw=2 et:
