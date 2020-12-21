# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=jdtls
pkgver=0.67.0
pkgrel=1
pkgdesc="Eclipse Java language server"
arch=(any)
url="https://github.com/eclipse/eclipse.jdt.ls"
license=('EPL')
depends=('java-runtime')
makedepends=()
source=("https://download.eclipse.org/jdtls/milestones/0.67.0/jdt-language-server-0.67.0-202012170459.tar.gz"
        "launcher.sh")
sha256sums=('b4b14a30ac4b513b69f2d0a6297e7a8766d65bcdccadf3c26ef08c4385e31f87'
            '813801c237676764f6fb005df3ccaaee33c7cc0ab54fc1c73ef3cf4cee5a65de')

package() {
    mkdir -p "${pkgdir}/usr/share/java/jdtls"
    cp -R "${srcdir}/"config_* "${srcdir}/features" "${srcdir}/plugins" "${pkgdir}/usr/share/java/jdtls"
    mkdir -p "${pkgdir}/usr/bin"
    install "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/jdtls"
}
