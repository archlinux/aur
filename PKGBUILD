# Maintainer: Ankit R Gadiya <arch@argp.in>

pkgname='sbm'
pkgver=0.9
pkgrel=2
pkgdesc="simple bandwidth monitor"
url="http://git.2f30.org/sbm"
license=('custom:MIT/X Consortium')
source=("https://dl.2f30.org/releases/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a77e3e39113380f83e01b3999aee7e4be0c3758b50e11eac4f874807e65ae096b51b0a037b5556635386e204e92bf0f255bd8ee24debf3d1f266a480e4bfa520')
arch=('x86_64')

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
