# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=jdtls
pkgver=1.8.0
pkgrel=1
pkgdesc="Eclipse Java language server"
arch=(any)
url="https://github.com/eclipse/eclipse.jdt.ls"
license=('EPL')
depends=('java-runtime')
makedepends=()
source=("https://download.eclipse.org/jdtls/milestones/1.8.0/jdt-language-server-1.8.0-202201261434.tar.gz"
        "launcher.sh")
sha256sums=('68378599cca158f7aab4d54782efcda9258ef98389ba7757c68d59284ed69672'
            '78c7dc2936dedd27011a787438e85888c3846a16115ae02b281eb672456d547c')

package() {
    mkdir -p "${pkgdir}/usr/share/java/jdtls"
    cp -R "${srcdir}/"config_* "${srcdir}/features" "${srcdir}/plugins" "${pkgdir}/usr/share/java/jdtls"
    mkdir -p "${pkgdir}/usr/bin"
    install "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/jdtls"
}
