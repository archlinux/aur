# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=jdtls
pkgver=0.31.0
pkgrel=1
pkgdesc="Eclipse Java language server"
arch=(any)
url="https://github.com/eclipse/eclipse.jdt.ls"
license=('EPL')
depends=('java-runtime')
makedepends=()
source=("https://download.eclipse.org/jdtls/milestones/0.31.0/jdt-language-server-${pkgver}-201901170528.tar.gz"
        "launcher.sh")
sha256sums=('454e1e9e4aebb3e924791cce589b38f1059df8a5abfd12ea54e04f327edd7424'
            '4b35fd4860d6b383cfe0943d70d24d07fe48a7c4cde220b75f72d5b4e29ef81f')

package() {
    mkdir -p "${pkgdir}/usr/share/java/jdtls"
    cp -R "${srcdir}/"config_* "${srcdir}/features" "${srcdir}/plugins" "${pkgdir}/usr/share/java/jdtls"
    mkdir -p "${pkgdir}/usr/bin"
    install "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/jdtls"
}
