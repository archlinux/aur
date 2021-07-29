# Maintainer: Laurent Laffont <lolgzs@gresille.org>

pkgname="axolotl-bin"
pkgdesc="Axolotl binary from deb."
pkgver=1.0.1
pkgrel=2
_pkgver='1.0.1-2'
arch=('aarch64')
url="https://github.com/nanu-c/axolotl/"
license=('GPL3')
provides=('axolotl')
source=(
    "https://github.com/nuehm-arno/axolotl-mobian-package/raw/main/axolotl_${_pkgver}_arm64.deb"
)
validpgpkeys=('0F93160A4198CE8993FE7F53D91B90C8A18672B5') # Laurent Laffont <lolgzs@gresille.org>
md5sums=(
    '76d142a82aa6d101d11101163a4d2df2'
)
noextract=("axolotl_${_pkgver}_arm64.deb")


prepare() {
  bsdtar -O -x -f axolotl_${_pkgver}_arm64.deb data.tar.xz | bsdtar -x -f -
}


package() {
  cp -fR $srcdir/etc $pkgdir/
  cp -fR $srcdir/usr $pkgdir/
}
