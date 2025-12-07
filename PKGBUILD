# Maintainer: JuansesDev <juansesdev@gmail.com>
pkgname=mtc-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Modular Template CLI for .NET"
arch=('x86_64')
url="https://github.com/JuansesDev/MTC"
license=('MIT')
depends=('zlib' 'icu' 'openssl')
provides=('mtc')
conflicts=('mtc')

source=("https://github.com/JuansesDev/MTC/releases/download/V.${pkgver}/mtc-linux-x64-${pkgver}.tar.gz")

sha256sums=('5cb22c14fc65368583fd2ae8bc2e4d08bd2519f811f1ad18755d404b1fe01fe1')

package() {
    # Crear directorios destino
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/mtc/Templates"

    # Instalar binario
    install -m755 "${srcdir}/MTC" "${pkgdir}/usr/bin/mtc"

    # Instalar Templates (recursivamente)
    cp -r "${srcdir}/templates/"* "${pkgdir}/usr/share/mtc/Templates/"
    chmod -R 755 "${pkgdir}/usr/share/mtc"
}
