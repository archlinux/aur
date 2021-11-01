# Maintainer: Laurent Laffont <lolgzs@gresille.org>

pkgname="axolotl-bin"
pkgdesc="Axolotl binary from deb."
pkgver=1.0.7
pkgrel=1
deb_pkgver='1.0.7-1'
arch=('aarch64')
url="https://github.com/nanu-c/axolotl/"
license=('GPL3')
provides=('axolotl')
source=(
    "https://github.com/nuehm-arno/axolotl-mobian-package/raw/v${deb_pkgver}/axolotl_${deb_pkgver}_arm64.deb"
)
validpgpkeys=('0F93160A4198CE8993FE7F53D91B90C8A18672B5') # Laurent Laffont <lolgzs@gresille.org>
md5sums=(
    '19431c74d02ae9a5532465ea05f8410c'
)
noextract=("axolotl_${deb_pkgver}_arm64.deb")


prepare() {
  bsdtar -O -x -f axolotl_${deb_pkgver}_arm64.deb data.tar.xz | bsdtar -x -f -
}


package() {
  cp -fR $srcdir/etc $pkgdir/
  cp -fR $srcdir/usr $pkgdir/
}
