# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

_pkgname=mksh
_pkgver=59c-1
_pkgrel=2
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
source=("$_pkgname-$pkgver-$pkgrel-$_arch.tar.zst::https://gitlab.com/api/v4/projects/59987755/packages/generic/$_pkgname/$_pkgver/$_pkgname-$_pkgver-$_arch.pkg.tar.zst")
noextract=("$_pkgname-$pkgver-$pkgrel-$_arch.tar.zst")
sha256sums=('a2f063fdb6063c8882ea3521c3ecd5fbddcd6ec4e5594d5c89cd7e94e53482e5')
install=mksh.install

package() {
    tar -C "$pkgdir" -xvf "$srcdir/$_pkgname-$pkgver-$pkgrel-$_arch.tar.zst" --exclude '.BUILDINFO' --exclude '.MTREE' --exclude '.PKGINFO' --exclude '.INSTALL'
}
