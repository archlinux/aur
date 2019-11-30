# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=privkey2qr
pkgver=1.0
pkgrel=1
pkgdesc="Generate QR codes for storing private keys offline."
arch=("x86_64")
url="https://git.sr.ht/~craftyguy/privkey2qr"
license=("GPL3")
depends=("python3" "qrencode")
makedepends=("scdoc")
provides=("${pkgname}")
source=("https://git.sr.ht/~craftyguy/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('a02d1cab94c674c9e6f2aa324c87afa56878f14d8858fbd5a5d145ea7c8e02c9daeb1d5588caa035e909c29a5587c155e1bcb45b01a8f01cf8040822e9025d4b')

build() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        scdoc < doc/privkey2qr.1.scd > doc/privkey2qr.1
}

package() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        install -Dm644 doc/privkey2qr.1 "${pkgdir}/usr/share/man/man1/privkey2qr.1"
        install -Dm755 privkey2qr "${pkgdir}/usr/bin/privkey2qr"
}
