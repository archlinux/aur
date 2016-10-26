# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=hr
pkgver=1.0.0
pkgrel=1
pkgdesc="A port of LuRsT's hr to c"
arch=('i686' 'x86_64')
url="https://github.com/djmattyg007/hr"
license=('custom:Public Domain')
source=("https://github.com/djmattyg007/hr/releases/download/${pkgver}/hr-${pkgver}.tar.gz")
md5sums=('cd05ca336dc87bc0b22db97a831dd3ee')

build() {
    cd "hr-${pkgver}"
    ./configure --prefix=/usr
    make
}

check() {
    cd "hr-${pkgver}"
    make -k check
}

package() {
    cd "hr-${pkgver}"
    make DESTDIR="${pkgdir}/" install
    rm "${pkgdir}/usr/share/doc/hr/LICENSE.txt"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/hr/LICENSE.txt"
}
