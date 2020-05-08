# Maintainer: Popa Ioan Alexandru <alexioanpopa11@gmail.com>

pkgname=catcodec
pkgver=1.0.5
pkgrel=2
pkgdesc="A tool for decoding/encoding .cat files for OpenTTD"
arch=('i686' 'x86_64')
url="https://www.openttd.org/downloads/catcodec-releases/latest.html"
license=('GPL')
source=("https://cdn.openttd.org/catcodec-releases/1.0.5/catcodec-1.0.5-source.tar.xz")
md5sums=('732af1bbe83ffdde17dc10703896472d')
build() {
    cd ${srcdir}/$pkgname-$pkgver
    echo "prefix=/usr" >> Makefile.local
    echo "DO_NOT_INSTALL_CHANGELOG=1" >> Makefile.local
    echo "DO_NOT_INSTALL_LICENSE=1" >> Makefile.local
    make
}
package() {
    cd ${srcdir}/$pkgname-$pkgver
    sudo make install
}
