# Maintainer: Artur 'h0m3' Paiva <dr.hoome@gmail.com>
pkgname="c51asm"
pkgver="1.2"
pkgrel="1"
pkgdesc="Advanced C51 macro assembler developed by Atmel"
arch=("x86_64" "i686")
url="https://www.microchip.com/DevelopmentTools/ProductDetails/PartNO/C51ASM"
license=('custom')
depends_x86_64=("lib32-glibc")
depends_i686=("glibc")
source=("${pkgname}.csh" "${pkgname}.sh" "https://ww1.microchip.com/downloads/en/DeviceDoc/${pkgname}_linux_1-2.zip")
sha512sums=("e870ce1b8dc963ece768a49dae58d0e92288ab26a84f98ca734a3067e1de9f8a6719d6c6546d722b5677d94d9690d89ed710ebeb5b57c917c057d85f12a01b72"
        "5cc9bf0e6cb853f13f6a6f9f09ba8098191c35950dd32202a944fcedab7e45f2971e3c838f610d3f359cfedbc606a6c08aaf3552a0d8f76d81ea20f405689654"
        "22be1a9b87e91ca8c8e4218386aebd10e82595768a9b45ef7784148d3b2982bdf0bf2b29fe8171e358266a68b689b6b76e4c0cd7390df3b9c629114034423744")
package() {
    install -Dm755 "${srcdir}/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}/doc/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
    install -Dm644 "${srcdir}/${pkgname}/doc/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}.csh" "${pkgdir}/etc/profile.d/${pkgname}.csh"
    install -Dm644 "${srcdir}/${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
    mkdir -pv "${pkgdir}/usr/share/doc"
    mkdir -pv "${pkgdir}/usr/include"
    cp -r "${srcdir}/${pkgname}/doc" "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r "${srcdir}/${pkgname}/include" "${pkgdir}/usr/include/${pkgname}"
}
