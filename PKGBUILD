# Maintainer: Rain Clark <rain AT melonbread DOT dev>


pkgname=eget-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="Easily install prebuilt binaries from GitHub"
arch=('i686' 'x86_64')
url="https://github.com/zyedidia/eget"
license=('MIT')

source_i686=(https://github.com/zyedidia/eget/releases/download/v${pkgver}/eget-${pkgver}-linux_386.tar.gz)
source_x86_64=(https://github.com/zyedidia/eget/releases/download/v${pkgver}/eget-${pkgver}-linux_amd64.tar.gz)

sha256sums_i686=('b289aea5989481a3286ff3eec37a3575ea94133e74b450ae4b509b2a0496197a')
sha256sums_x86_64=('373a3bf0864344bfae684b575f01e9c4759b0aa7091dd9c325a3a373cf437d38')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/eget-*/eget ${pkgdir}/usr/bin/eget

    mkdir -p ${pkgdir}/usr/share/man/man1
    gzip ${srcdir}/eget-*/eget.1
    cp  ${srcdir}/eget-*/eget.1.gz ${pkgdir}/usr/share/man/man1
}
