# Maintainer: JuansesDev <juansesdev@gmail.com>
pkgname=mtc-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="Modular Template CLI for .NET"
arch=('x86_64')
url="https://github.com/JuansesDev/MTC"
license=('MIT')
depends=('zlib' 'icu' 'openssl')
provides=('mtc')
conflicts=('mtc')
options=('!strip')

source=("https://github.com/JuansesDev/MTC/releases/download/V.${pkgver}/mtc-linux-x64-${pkgver}.tar.gz")

sha256sums=('bf68409f281e7b1a247524fa9ab88c1229c87a7b88866ba31827fef5231e8fd8')

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
