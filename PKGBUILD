# Maintainer: Popa Ioan Alexandru <alexioanpopa11@gmail.com>

pkgname=catcodec
pkgver=1.0.5
pkgrel=1
pkgdesc="A tool for decoding/encoding .cat files for OpenTTD"
arch=('i686' 'x86_64')
url="https://www.openttd.org/downloads/catcodec-releases/latest.html"
license=('GPL')
source=("https://binaries.openttd.org/extra/catcodec/1.0.5/catcodec-1.0.5-source.tar.xz")
md5sums=('732af1bbe83ffdde17dc10703896472d')
build() {
    cd ${srcdir}/$pkgname-$pkgver
    make
}
package() {
    cd ${srcdir}/$pkgname-$pkgver
    #installing the ordinary binary
    install -Dm755 catcodec ${pkgdir}/usr/bin/catcodec
    #the reason I didn't simply make install is because the resulting man page goes throung a link not liked by makepkg
    #didn't bother to put the man page
}
