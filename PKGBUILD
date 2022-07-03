# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=jdtls
pkgver=1.13.0
pkgrel=1
pkgdesc="Eclipse Java language server"
arch=(any)
url="https://github.com/eclipse/eclipse.jdt.ls"
license=('EPL')
depends=('java-runtime' 'python')
makedepends=()
source=("https://download.eclipse.org/jdtls/milestones/1.13.0/jdt-language-server-1.13.0-202206301721.tar.gz")
sha256sums=('5a29ad28d765f408106a87b147b239696942a11f22f950c52dc37176fce9cfc9')

package() {
    mkdir -p "${pkgdir}/usr/share/java/jdtls"
    cp -R "${srcdir}/"config_* "${srcdir}/features" "${srcdir}/plugins" "${srcdir}/bin" "${pkgdir}/usr/share/java/jdtls"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s --relative "${pkgdir}/usr/share/java/jdtls/bin/jdtls" "${pkgdir}/usr/bin/jdtls"
}
