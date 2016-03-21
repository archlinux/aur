# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=malbolge-disassembler
pkgver=0.1
pkgrel=1
pkgdesc="transform Malbolge programs into their HeLL representation"
url="http://www.matthias-ernst.eu/malbolgedisassembler.html"
arch=('x86_64' 'i686')
license=('GPL3')
source=("http://www.matthias-ernst.eu/malbolge/disassembler.tar.gz")
md5sums=('f92c8c1459488dcda1f1c53c78f3b440')

build() {
    cd "${srcdir}"
    gcc -Wall -o md main.c avl-2.0.2a/avl.c
}

package() {
    install -Dm755 "${srcdir}/md" "${pkgdir}/usr/bin/md"
}
