# Maintainer:  Silvio Di Stefano <sdistefano@gmail.com>
pkgname=fortune-mod-shakespeare
pkgver=20140622
pkgrel=2
pkgdesc="Fortune cookies: Shakespeare."
url="https://www.gutenberg.org/ebooks/1041"
arch=('any')
license=('custom:PublicDomain')
depends=('fortune-mod')
source=('sonnets')
sha256sums=('e4ed97132a1759f50ebdd548958fb93b7c551ec148501fab1df7fd8dfb63bc31')

build() {
    cd "${srcdir}"
    for file in sonnets; do
        strfile -s ${file} ${file}.dat
    done
}

package(){
    cd "${srcdir}"
    for file in sonnets; do
        install -D -m644 ${file} "${pkgdir}/usr/share/fortune/shakespeare-${file}"
        install -D -m644 ${file}.dat "${pkgdir}/usr/share/fortune/shakespeare-${file}.dat"
    done
}
