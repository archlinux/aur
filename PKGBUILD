# Maintainer: Ankit R Gadiya <arch@argp.in>

pkgname='wificurse'
pkgver=0.3.9
pkgrel=1
pkgdesc="wifi jamming tool"
url="http://git.2f30.org/wificurse"
license=('GPL')
source=("git://git.2f30.org/wificurse.git")
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

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
