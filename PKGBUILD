# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=cross-install
pkgname=$_pkgname-bin
_pkgver=1.2.0-1
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
sha256sums=('aaa582468330b4fb508b1e81038608dda286e0121d24b6da68b4043f038c567a')

build() {
  rm "$_pkgname-$_pkgver-$_arch.pkg.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
