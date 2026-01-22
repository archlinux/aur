# Maintainer: Zoltan Egyhazi <szponerzolidev@proton.me>
pkgname=foxicons-theme
pkgver=1.0
pkgrel=1
pkgdesc="A collection of ugly icons from 2h foxcomm"
arch=('any')
url="https://github.com/SzponerZoli/foxicons-theme"
license=('Unlicense')
install=${pkgname}.install  # <--- Ez mondja meg a pacmannak, hogy keresse az .install fájlt
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/heads/master.tar.gz")
sha256sums=('SKIP') # Futtass 'updpkgsums'-t a GitHub release után!

package() {
    cd "${srcdir}/${pkgname%-*}"*-${pkgver} 2>/dev/null || cd "${srcdir}/foxicons-theme"

    install -dm 755 "${pkgdir}/usr/share/icons/fox-icons"
    cp -dr --no-preserve=ownership 16x16 32x32 48x48 64x64 96x96 128x128 256x256 index.theme "${pkgdir}/usr/share/icons/fox-icons/"
    
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
