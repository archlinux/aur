# Maintainer: Martin Jiřička <mjiricka at gmail dot com>

pkgname=archnews2
pkgver=1.3.0
pkgrel=1
pkgdesc="Utility for displaying Arch news feed in console"
arch=("any")
url="https://github.com/mjiricka/archnews"
license=("MIT")
depends=("python")
conflicts=("archnews-git")
source=("https://github.com/mjiricka/${pkgname%2}/archive/v${pkgver}.tar.gz")
b2sums=("d774d8495cf39bbb29ef0fa3dff21d7714c16edd450034a375b9f31bf32ee58d1a7d66f5ceabfe1dc5dc420b664f8862fc23db140d9e84bad11c57830c4b08f8")

package() {
    cd "${srcdir}/${pkgname%2}-${pkgver}"

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

