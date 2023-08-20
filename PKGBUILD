# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=cross-install
pkgname=$_pkgname-bin
_pkgver=1.1.0-1
pkgver=${_pkgver//-/.r}
pkgrel=1
pkgdesc="POSIX-complient cross-platform install command"
_arch=any
arch=($_arch)
license=(MPL2)
url=https://git.stefanwimmer128.eu/stefanwimmer128/cross-install
depends=('sh')
provides=($_pkgname)
conflicts=($_pkgname)
source=("https://git.stefanwimmer128.io/api/v4/projects/206/packages/generic/$_pkgname/$_pkgver/$_pkgname-$_pkgver-$_arch.pkg.tar.zst")
sha256sums=('0230d3524c913d3be2af400c368fda81efd6a6550999925f08709599d2a90f14')

build() {
  rm "$_pkgname-$_pkgver-$_arch.pkg.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
