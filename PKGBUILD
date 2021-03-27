# Maintainer: allencch <allencch at hotmail dot com>
pkgname=chipmunk-motif
pkgver=8
pkgrel=3
pkgdesc="Fast and efficient motif discovery tool, reborn and running"
arch=('any')
url="http://autosome.ru/ChIPMunk/"
license=('custom')
depends=("sh" "java-runtime")
source=("http://autosome.ru/ChIPMunk/chipmunk.jar")
sha256sums=('1dc81253be3dd016eff39a58d8ae142d9b6cccf1317a402596ae84715fd00b57')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/opt/ChIPMunk"
    cd "${srcdir}"
    install -m755 chipmunk.jar "${pkgdir}/opt/ChIPMunk"

    echo "#!/bin/sh" > ${pkgdir}/usr/bin/ChIPMunk
    echo 'java -jar /opt/ChIPMunk/chipmunk.jar "$@"' >> ${pkgdir}/usr/bin/ChIPMunk
    chmod 755 ${pkgdir}/usr/bin/ChIPMunk
}
