# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=cross-install
pkgname=$_pkgname-bin
_pkgver=1.2.0-4
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
source=("https://codeberg.org/stefanwimmer128/cross-install-pkgbuild/releases/download/$_pkgver/$_pkgname-$_pkgver-$_arch.pkg.tar.zst")
sha256sums=('65befb41c9b243a5b9cb0c729d3654d252b437a62074659bfee64265589ba148')

build() {
  rm "$_pkgname-$_pkgver-$_arch.pkg.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
