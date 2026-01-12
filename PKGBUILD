# Maintainer: Artemiy Imaev <justmonika@aircgroup.ru>
# Contributor: Viacheslav <v.n.chulkin@gmail.com>

pkgname=gigaide
pkgver=251.26927.53
pkgrel=1

pkgdesc="A fork JB IDEA and PyCharm"
arch=("x86_64")
url="https://gitverse.ru/features/gigaide/"
license=("apache-2.0")

depends=("giflib" "libxtst" "libxrender")
source=("https://gigaide.ru/downloadlast/gigaideCE-${pkgver}.tar.gz" "gigaide.desktop")
sha256sums=(
    "2517c28ec1c5cef802114bcc89b47463de49d7c3a992caf9bc0df365fda4ec10"
    "9722c9aec34fb35a2768fa2002cfdddfc0479b847f307ddfb27fab5b25bb2c11"
    )


package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/icons"

    cp -r "${srcdir}/gigaide-CE-${pkgver}"/* "${pkgdir}/opt/${pkgname}/"
    cp "${pkgdir}/opt/${pkgname}/bin/idea.png" "${pkgdir}/usr/share/icons/gigaide.png"
    cp "${srcdir}/gigaide.desktop" "${pkgdir}/usr/share/applications/"
    ln -s "/opt/${pkgname}/bin/idea" "${pkgdir}/usr/bin/gigaide"
}
