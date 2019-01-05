# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=jdtls
pkgver=0.30.0
pkgrel=2
pkgdesc="Eclipse Java language server"
arch=(any)
url="https://github.com/eclipse/eclipse.jdt.ls"
license=('EPL')
depends=('java-runtime')
makedepends=()
source=("https://download.eclipse.org/jdtls/milestones/${pkgver}/jdt-language-server-${pkgver}-201812180348.tar.gz"
        "launcher.sh")
sha256sums=('152e24fde6c13a488e4bb888e247f1370cec9e8eb1bafa836a95080bc990d689'
            '4b35fd4860d6b383cfe0943d70d24d07fe48a7c4cde220b75f72d5b4e29ef81f')

package() {
    mkdir -p "${pkgdir}/usr/share/java/jdtls"
    cp -R "${srcdir}/"config_* "${srcdir}/features" "${srcdir}/plugins" "${pkgdir}/usr/share/java/jdtls"
    mkdir -p "${pkgdir}/usr/bin"
    install "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/jdtls"
}
