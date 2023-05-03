# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=mksh
pkgname=$_pkgname-bin
_pkgver=59.c-4
pkgver=${_pkgver//-/.r}
pkgrel=2
pkgdesc='MirBSD Korn Shell'
_arch=x86_64
arch=($_arch)
license=(custom)
url='https://www.mirbsd.org/mksh.htm'
depends=('glibc')
provides=($_pkgname)
conflicts=($_pkgname)
source=("https://git.stefanwimmer128.io/api/v4/projects/163/packages/generic/$_pkgname/$_pkgver/$_pkgname-$_pkgver-$_arch.pkg.tar.zst")
sha256sums=('52ec23b52a8290e9eab1cc864bf7701492a29122e2ba5f86feb43540357ea3e4')
install=mksh.install

build() {
  rm "$_pkgname-$_pkgver-$_arch.pkg.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO .INSTALL
}

package() {
    cp -r . "$pkgdir"
}
