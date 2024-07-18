# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

_pkgname=mksh
_pkgver=59.c-8
_arch=x86_64

pkgname=$_pkgname-bin
pkgver=${_pkgver//-/.r}
pkgrel=2
pkgdesc='MirBSD Korn Shell'
arch=($_arch)
license=(custom)
url='https://www.mirbsd.org/mksh.htm'
depends=('glibc')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$_pkgver-$_arch.tar.zst::https://gitlab.com/api/v4/projects/59987755/packages/generic/$_pkgname/$_pkgver/$_pkgname-$_pkgver-$_arch.pkg.tar.zst")
sha256sums=('d96e9a4f01473361672ecff6057d1c2dd99908ddca1633a7fc576bc8c576972a')
install=mksh.install

build() {
  rm "$_pkgname-$_pkgver-$_arch.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO .INSTALL
}

package() {
    cp -r . "$pkgdir"
}
