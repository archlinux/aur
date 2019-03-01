# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=jdtls
pkgver=0.33.0
pkgrel=1
pkgdesc="Eclipse Java language server"
arch=(any)
url="https://github.com/eclipse/eclipse.jdt.ls"
license=('EPL')
depends=('java-runtime')
makedepends=()
source=("https://download.eclipse.org/jdtls/milestones/0.33.0/jdt-language-server-0.33.0-201902202353.tar.gz"
        "launcher.sh")
sha256sums=('d2282bdf6546d146bd4f3649cae953eaab8552a9297f2b61199fee2248ae910e'
            '813801c237676764f6fb005df3ccaaee33c7cc0ab54fc1c73ef3cf4cee5a65de')

package() {
    mkdir -p "${pkgdir}/usr/share/java/jdtls"
    cp -R "${srcdir}/"config_* "${srcdir}/features" "${srcdir}/plugins" "${pkgdir}/usr/share/java/jdtls"
    mkdir -p "${pkgdir}/usr/bin"
    install "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/jdtls"
}
