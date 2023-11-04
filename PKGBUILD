# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=cross-install
pkgname=$_pkgname-bin
_pkgver=1.2.0-2
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
source=("https://codeberg.org/api/packages/stefanwimmer128/generic/$_pkgname/$_pkgver/$_pkgname-$_pkgver-$_arch.pkg.tar.zst")
sha256sums=('503b94e64be786dffb6390c6fc538e00a4e0a921add05b846c1d80f6b8d0cadd')

build() {
  rm "$_pkgname-$_pkgver-$_arch.pkg.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
