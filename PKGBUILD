# Maintainer: Rain Clark <rain AT melonbread DOT dev>


pkgname=eget-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Easily install prebuilt binaries from GitHub"
arch=('i686' 'x86_64')
url="https://github.com/zyedidia/eget"
license=('MIT')

source_i686=(https://github.com/zyedidia/eget/releases/download/v${pkgver}/eget-${pkgver}-linux_386.tar.gz)
source_x86_64=(https://github.com/zyedidia/eget/releases/download/v${pkgver}/eget-${pkgver}-linux_amd64.tar.gz)

sha256sums_i686=('cb3adca582f716833263eb74d42b713068be4054fd00f15492545e70c207684f')
sha256sums_x86_64=('83f8af0862cf1a7f9c3f15139da2a7826829df3eeb3ea2963dcfabb38f671769')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/eget-*/eget ${pkgdir}/usr/bin/eget

    mkdir -p ${pkgdir}/usr/share/man/man1
    gzip ${srcdir}/eget-*/eget.1
    cp  ${srcdir}/eget-*/eget.1.gz ${pkgdir}/usr/share/man/man1
}
