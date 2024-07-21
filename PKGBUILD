# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

_pkgname=mksh
_pkgver=59c-1
_pkgrel=1
_arch=x86_64

pkgname=$_pkgname-bin
pkgver=${_pkgver%-*}
pkgrel=${_pkgver#*-}.${_pkgrel}
pkgdesc='MirBSD Korn Shell'
arch=($_arch)
license=(custom)
url='https://www.mirbsd.org/mksh.htm'
depends=('glibc')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$_pkgver-$_arch.tar.zst::https://gitlab.com/api/v4/projects/59987755/packages/generic/$_pkgname/$_pkgver/$_pkgname-$_pkgver-$_arch.pkg.tar.zst")
sha256sums=('a2f063fdb6063c8882ea3521c3ecd5fbddcd6ec4e5594d5c89cd7e94e53482e5')
install=mksh.install

build() {
  rm "$_pkgname-$_pkgver-$_arch.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO .INSTALL
}

package() {
    cp -r . "$pkgdir"
}
