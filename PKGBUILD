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
sha256sums=('4127812c67645fa30966888d8299b2dbe1693e628d6cb6d476258edf4bc05ee7')
install=mksh.install

build() {
  rm "$_pkgname-$_pkgver-$_arch.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO .INSTALL
}

package() {
    cp -r . "$pkgdir"
}
