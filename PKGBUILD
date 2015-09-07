# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=lmao
pkgver=0.5.1
pkgrel=1
pkgdesc="Low-level Malbolge Assembler, Ooh! is a tool that builds Malbolge programs from HeLL"
url="http://www.matthias-ernst.eu/malbolgeassembler.html"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('glibc')
makedepends=('bison' 'flex' 'make' 'gcc' 'doxygen')
source=("http://www.matthias-ernst.eu/malbolge/lmao.tar.gz")
md5sums=('c4160c2eb7a24e9a783b2c1876ea33b1')
 
build() {
    cd "${srcdir}/${pkgname}"
    make all
}
  
package() {
    install -Dm755 ${srcdir}/lmao/bin/lmao ${pkgdir}/usr/bin/lmao
    install -Dm644 ${srcdir}/lmao/example_cat_halt_on_eof.hell ${pkgdir}/usr/share/lmao/example_cat_halt_on_eof.hell
    install -Dm644 ${srcdir}/lmao/example_hello_world.hell ${pkgdir}/usr/share/lmao/example_hello_world.hell
    install -Dm644 ${srcdir}/lmao/example_simple_cat.hell ${pkgdir}/usr/share/lmao/example_simple_cat.hell
}
