# Maintainer: Martin Jiřička <mjiricka at gmail dot com>

pkgname=archnews2
pkgver=1.2.0
pkgrel=1
pkgdesc="Utility for displaying Arch news feed in console"
arch=("any")
url="https://github.com/mjiricka/archnews"
license=("MIT")
depends=("python")
conflicts=("archnews-git")
source=("https://github.com/mjiricka/${pkgname%2}/archive/v${pkgver}.tar.gz")
md5sums=("df83dcbbca1a5df3f1cad97f63b94f03")

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

