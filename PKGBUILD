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
sha256sums=('a7ea57128d4526ba38685b4ab1f20ec3200919b0f15fed9d064b7b91d10f714d')
install=mksh.install

build() {
  rm "$_pkgname-$_pkgver-$_arch.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO .INSTALL
}

package() {
    cp -r . "$pkgdir"
}
