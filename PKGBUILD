# Maintainer: JuansesDev <juansesdevcontact@gmail.com>
pkgname=mtc-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Modular Template CLI for .NET"
arch=('x86_64')
url="[https://github.com/JuansesDev/MTC](https://github.com/JuansesDev/MTC)"
license=('MIT')
depends=('zlib' 'icu' 'openssl')
provides=('mtc')
conflicts=('mtc')

source=("[https://github.com/JuansesDev/MTC/releases/download/V.1.0.0/mtc-linux-x64-1.0.0.tar.gz](https://github.com/JuansesDev/MTC/releases/download/V.1.0.0/mtc-linux-x64-1.0.0.tar.gz)")

sha256sums=('AQUI_VA_EL_HASH_SHA256_DEL_TAR_GZ_LINUX')

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
