# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

_pkgname=mksh
_pkgver=59.c-9
_arch=x86_64

pkgname=$_pkgname-bin
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc='MirBSD Korn Shell'
arch=($_arch)
license=(custom)
url='https://www.mirbsd.org/mksh.htm'
depends=('glibc')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver-$pkgrel-$_arch.tar.zst::https://gitlab.com/api/v4/projects/59987755/packages/generic/$_pkgname/$_pkgver/$_pkgname-$_pkgver-$_arch.pkg.tar.zst")
noextract=("$_pkgname-$pkgver-$pkgrel-$_arch.tar.zst")
sha256sums=('01f64a9c596413247243cf52457f7c56bb5b3d149e0ff8a39aca019781e90d6a')
install=mksh.install

package() {
    tar -C "$pkgdir" -xvf "$srcdir/$_pkgname-$pkgver-$pkgrel-$_arch.tar.zst" --exclude '.BUILDINFO' --exclude '.MTREE' --exclude '.PKGINFO' --exclude '.INSTALL'
}
