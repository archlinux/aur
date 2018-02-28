# Maintainer: Ankit R Gadiya <arch@argp.in>

pkgname='wificurse'
pkgver=0.3.9
pkgrel=2
pkgdesc="wifi jamming tool"
url="http://git.2f30.org/wificurse"
license=('GPL')
source=("https://dl.2f30.org/releases/${pkgname}-${pkgver}.tar.gz")
md5sums=('fd788fec74a88882fa5cc7c4cbf11aaf')
arch=('x86_64')

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
