# Maintainer: Martin Jiřička <mjiricka at gmail dot com>

pkgname=archnews2
pkgver=1.3.1
pkgrel=1
pkgdesc="Utility for displaying Arch news feed in console"
arch=("any")
url="https://github.com/mjiricka/archnews"
license=("MIT")
depends=("python")
conflicts=("archnews-git")
source=("https://github.com/mjiricka/${pkgname%2}/archive/v.${pkgver}.tar.gz")
b2sums=("62a22d85c72233be0d5ccaf544d177c15233bd8540eeebb12b1e2f455354e9746376f1b2dc00c4c872b8b25dbe53bf0c1d73e3dd518a189fe52d57a72fd9f858")

package() {
    cd "${srcdir}/${pkgname%2}-v.${pkgver}"

    # Binaries
    mkdir -p ${pkgdir}/usr/bin/
    install archnews archnews_wrap ${pkgdir}/usr/bin/

    # Man pages
    mkdir -p ${pkgdir}/usr/share/man/man1/
    install archnews.1 ${pkgdir}/usr/share/man/man1/archnews.1

    # License
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
    install LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}

