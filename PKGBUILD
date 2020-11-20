# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=jdtls
pkgver=0.65.0
pkgrel=1
pkgdesc="Eclipse Java language server"
arch=(any)
url="https://github.com/eclipse/eclipse.jdt.ls"
license=('EPL')
depends=('java-runtime')
makedepends=()
source=("https://download.eclipse.org/jdtls/milestones/0.65.0/jdt-language-server-0.65.0-202011182255.tar.gz"
        "launcher.sh")
sha256sums=('2c14a41ff3f6e4ea276313208e2a9d53ae8ca2f826558b528531bbacc18ad5b0'
            '813801c237676764f6fb005df3ccaaee33c7cc0ab54fc1c73ef3cf4cee5a65de')

package() {
    mkdir -p "${pkgdir}/usr/share/java/jdtls"
    cp -R "${srcdir}/"config_* "${srcdir}/features" "${srcdir}/plugins" "${pkgdir}/usr/share/java/jdtls"
    mkdir -p "${pkgdir}/usr/bin"
    install "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/jdtls"
}
