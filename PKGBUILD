# Maintainer: Ankit R Gadiya <arch@argp.in>

pkgname='skroll'
pkgver=0.6
pkgrel=1
pkgdesc="text scroller"
url="http://git.2f30.org/skroll"
license=('custom:WTFPL')
source=("git://git.2f30.org/skroll.git")
sha512sums=('SKIP')
arch=('x86_64')
makedepends=('git')

prepare() {
    cd "${pkgname}"
    git checkout "v${pkgver}"
}

build() {
    cd "${pkgname}"
    make
}

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
