# Maintainer: Laurent Laffont <lolgzs@gresille.org>

pkgname="axolotl-bin"
pkgdesc="Axolotl binary from deb."
pkgver=1.5.0
pkgrel=1
deb_pkgver='1.5.0-1'
arch=('aarch64')
url="https://github.com/nanu-c/axolotl/releases/download"
license=('GPL3')
provides=('axolotl')
source=(
    "${url}/v${pkgver}/axolotl_${deb_pkgver}_arm64.deb"
)
validpgpkeys=('0F93160A4198CE8993FE7F53D91B90C8A18672B5') # Laurent Laffont <lolgzs@gresille.org>
md5sums=(
    '40118417129c186cb70f313a6e017d4a'
)
noextract=("axolotl_${deb_pkgver}_arm64.deb")


prepare() {
  bsdtar -O -x -f axolotl_${deb_pkgver}_arm64.deb data.tar.xz | bsdtar -x -f -
}


package() {
  cp -fR $srcdir/etc $pkgdir/
  cp -fR $srcdir/usr $pkgdir/
}
