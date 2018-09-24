# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=malbolge-disassembler
pkgver=0.1
pkgrel=1
pkgdesc="transform Malbolge programs into their HeLL representation"
url="https://www.matthias-ernst.eu/malbolgedisassembler.html"
arch=('x86_64' 'i686')
license=('GPL3')
source=("https://www.matthias-ernst.eu/malbolge/disassembler.tar.gz")
md5sums=('e524dbd6ab84c1c2bbb34554f9d2163a')

build() {
    cd "${srcdir}"
    gcc -Wall -o md main.c avl-2.0.2a/avl.c
}

package() {
    install -Dm755 "${srcdir}/md" "${pkgdir}/usr/bin/md"
}
