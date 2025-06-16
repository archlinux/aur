# Maintainer: Artemiy Imaev <justmonika@aircgroup.ru>
# Contributor: Viacheslav <v.n.chulkin@gmail.com>

pkgname=gigaide
pkgver=242.21829.142.2
pkgrel=1

pkgdesc="A fork JB IDEA and PyCharm"
arch=("x86_64")
url="https://gitverse.ru/features/gigaide/"
license=("apache-2.0")

depends=("giflib" "libxtst" "libxrender")
source=("https://gigaide.ru/downloadlast/gigaideCE-${pkgver}.tar.gz" "gigaide.desktop")
sha256sums=(
    "ceb470f0c753a5a2ac069ff2927145da2b1151f01e60aa9dba78be1c864f423d"
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
