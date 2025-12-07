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

source=("https://github.com/JuansesDev/MTC/releases/download/V${pkgver}/mtc-linux-x64-${pkgver}.tar.gz")

sha256sums=('56bcb09c08d6057feec71540f416ff4bf3782fe8ceaa0d404d93af09b84a65fc')

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
