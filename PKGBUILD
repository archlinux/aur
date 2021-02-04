# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=wegstr
pkgver=3.1.0
pkgrel=2
pkgdesc="Controlling software Wegstr"
arch=("any")
url="https://wegstr.com/software"
license=("unknown")
depends=("java-runtime")
source=(
  "https://wegstr.com/download/Wegstr_v$pkgver.zip"
  "wegstr"
)
sha256sums=(
  "71d3f53bb90e5a89257abe6b7b8a2eff9d64e31ec717abc2ad890835f31bcdda"
  "37231a0788e49ea9b6ee447433503b6c38d65c2002e56d5bbff5ad2da43de08c"
)

package() {
  mkdir -p "$pkgdir/usr/share/$pkgname"

  cp -r \
    "$srcdir/Wegstr/Linux/wegstr.jar" \
    "$srcdir/Wegstr/Samples (g-code)" \
    "$pkgdir/usr/share/$pkgname"

  install -Dm 755 "$srcdir/wegstr" "$pkgdir/usr/bin/wegstr"
}
