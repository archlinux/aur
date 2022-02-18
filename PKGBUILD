# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=wegstr
pkgver=3.1.1
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
  "8bb03bc810fb57b48e427a9d10e2f1bdcf41530e044d08c9dd7229f1dc77d329"
  "37231a0788e49ea9b6ee447433503b6c38d65c2002e56d5bbff5ad2da43de08c"
)

package() {
  mkdir -p "$pkgdir/usr/share/$pkgname"

  cp -r \
    "$srcdir/Wegstr/Linux/wegstr.jar" \
    "$srcdir/Wegstr/Utils/Samples (g-code)" \
    "$pkgdir/usr/share/$pkgname"

  install -Dm 755 "$srcdir/wegstr" "$pkgdir/usr/bin/wegstr"
}
