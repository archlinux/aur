# Maintainer: allencch <allencch at hotmail dot com>
pkgname=chipmunk-motif
pkgver=8
pkgrel=2
pkgdesc="Fast and efficient motif discovery tool, reborn and running"
arch=('any')
url="http://autosome.ru/ChIPMunk/"
license=('custom')
depends=("sh" "java-runtime")
source=("http://autosome.ru/ChIPMunk/chipmunk.jar")
sha256sums=('ce19b82578457e29c975ec15a515074bb0b840f3432b65a642d09186d41ae1af')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/opt/ChIPMunk"
    cd "${srcdir}"
    install -m755 chipmunk.jar "${pkgdir}/opt/ChIPMunk"

    echo "#!/bin/sh" > ${pkgdir}/usr/bin/ChIPMunk
    echo 'java -jar /opt/ChIPMunk/chipmunk.jar "$@"' >> ${pkgdir}/usr/bin/ChIPMunk
    chmod 755 ${pkgdir}/usr/bin/ChIPMunk
}
