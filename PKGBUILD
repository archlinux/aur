# Maintainer: Rain Clark <rain AT melonbread DOT dev>


pkgname=eget-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Easily install prebuilt binaries from GitHub"
arch=('i686' 'x86_64')
url="https://github.com/zyedidia/eget"
license=('MIT')

source_i686=(https://github.com/zyedidia/eget/releases/download/v${pkgver}/eget-${pkgver}-linux_386.tar.gz)
source_x86_64=(https://github.com/zyedidia/eget/releases/download/v${pkgver}/eget-${pkgver}-linux_amd64.tar.gz)

sha256sums_i686=('896b8bc5026afda761a22f9f2522a7125b6ec028e3bd94b176006deb807208f9')
sha256sums_x86_64=('6d874e0d405ace206b0385bd0903c3cca5ef8585ba6a5bee5b291c5ec8bb55db')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/eget-*/eget ${pkgdir}/usr/bin/eget

    mkdir -p ${pkgdir}/usr/share/man/man1
    gzip ${srcdir}/eget-*/eget.1
    cp  ${srcdir}/eget-*/eget.1.gz ${pkgdir}/usr/share/man/man1
}
