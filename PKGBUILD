# Maintainer: allencch <allencch at hotmail dot com>
pkgname=chipmunk-motif
pkgver=1.0
pkgrel=2
pkgdesc="Fast and efficient motif discovery tool, reborn and running"
arch=('any')
url="http://autosome.ru/ChIPMunk/"
license=('custom')
depends=("sh")
source=("http://autosome.ru/ChIPMunk/chipmunk.jar")
sha256sums=('078d1546ec851ef96eaf76ec9fc1b0049993fc821436cc1d3a1a6b3048841748')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/opt/ChIPMunk"
    cd "${srcdir}"
    install -m755 chipmunk.jar "${pkgdir}/opt/ChIPMunk"

    echo "#!/bin/sh" > ${pkgdir}/usr/bin/ChIPMunk
    echo 'java -jar /opt/ChIPMunk/chipmunk.jar "$@"' >> ${pkgdir}/usr/bin/ChIPMunk
    chmod 755 ${pkgdir}/usr/bin/ChIPMunk
}
