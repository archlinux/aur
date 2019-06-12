pkgname=ruri
pkgver=1.1.0
pkgrel=2
pkgdesc="A CRC32 checker with file name checking."
arch=(any)
url="https://gitlab.com/Timmy1e/ruri"
license=(GPL3)
depends=(
  "python"
  "python-colorama"
  "python-progressbar"
)
makedepends=(
  "python-pip"
)
build() {
  pip3 install --isolated --no-deps --ignore-installed --no-warn-script-location --root="$srcdir/" "ruri==${pkgver}"
}
package() {
  cp -R $srcdir/* $pkgdir/
  python3 -O -m compileall "${pkgdir}/"
}
