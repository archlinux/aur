# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=jdtls
pkgver=0.70.0
pkgrel=1
pkgdesc="Eclipse Java language server"
arch=(any)
url="https://github.com/eclipse/eclipse.jdt.ls"
license=('EPL')
depends=('java-runtime')
makedepends=()
source=("https://download.eclipse.org/jdtls/milestones/0.70.0/jdt-language-server-0.70.0-202103051608.tar.gz"
        "launcher.sh")
sha256sums=('3777c13a15cf81d05ccfe46fc69eff317773bf333a93b2e147d7306620c71339'
            '813801c237676764f6fb005df3ccaaee33c7cc0ab54fc1c73ef3cf4cee5a65de')

package() {
    mkdir -p "${pkgdir}/usr/share/java/jdtls"
    cp -R "${srcdir}/"config_* "${srcdir}/features" "${srcdir}/plugins" "${pkgdir}/usr/share/java/jdtls"
    mkdir -p "${pkgdir}/usr/bin"
    install "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/jdtls"
}
