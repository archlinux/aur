# Maintainer: Rain Clark <rain AT melonbread DOT dev>


pkgname=eget-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Easily install prebuilt binaries from GitHub"
arch=('i686' 'x86_64')
url="https://github.com/zyedidia/eget"
license=('MIT')

source_i686=(https://github.com/zyedidia/eget/releases/download/v${pkgver}/eget-${pkgver}-linux_386.tar.gz)
source_x86_64=(https://github.com/zyedidia/eget/releases/download/v${pkgver}/eget-${pkgver}-linux_amd64.tar.gz)

sha256sums_i686=('382039d955132c337890c68c106e243806c0619909bc41051744f8f8df0851ac')
sha256sums_x86_64=('2a1d6bc08c06f3f44268f94059b53df99f55ee062d0c57ac93d7fc029ffc1993')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/eget-*/eget ${pkgdir}/usr/bin/eget

    mkdir -p ${pkgdir}/usr/share/man/man1
    gzip ${srcdir}/eget-*/eget.1
    cp  ${srcdir}/eget-*/eget.1.gz ${pkgdir}/usr/share/man/man1
}
