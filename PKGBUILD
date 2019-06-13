# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=jdtls
pkgver=0.40.0
pkgrel=1
pkgdesc="Eclipse Java language server"
arch=(any)
url="https://github.com/eclipse/eclipse.jdt.ls"
license=('EPL')
depends=('java-runtime')
makedepends=()
source=("http://download.eclipse.org/jdtls/milestones/0.40.0/jdt-language-server-0.40.0-201906040221.tar.gz"
        "launcher.sh")
sha256sums=('4c03f7f9d07f5532db9b309ff7552a1766f6d49019c4f9fa71b49aebc92234ba'
            '813801c237676764f6fb005df3ccaaee33c7cc0ab54fc1c73ef3cf4cee5a65de')

package() {
    mkdir -p "${pkgdir}/usr/share/java/jdtls"
    cp -R "${srcdir}/"config_* "${srcdir}/features" "${srcdir}/plugins" "${pkgdir}/usr/share/java/jdtls"
    mkdir -p "${pkgdir}/usr/bin"
    install "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/jdtls"
}
