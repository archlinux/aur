# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=jdtls
pkgver=1.24.0
pkgrel=1
pkgdesc="Eclipse Java language server"
arch=(any)
url="https://github.com/eclipse/eclipse.jdt.ls"
license=('EPL')
depends=('java-runtime>=17')
optdepends=('python: for the official launcher script')
makedepends=()
source=("https://download.eclipse.org/jdtls/milestones/1.24.0/jdt-language-server-1.24.0-202306011728.tar.gz")
sha256sums=('ed73a4f6870a1df618894506a7c8da734c43e1c6325d2cf75cb934c0f9c2f968')

package() {
    mkdir -p "${pkgdir}/usr/share/java/jdtls"
    cp -R "${srcdir}/"config_* "${srcdir}/features" "${srcdir}/plugins" "${srcdir}/bin" "${pkgdir}/usr/share/java/jdtls"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s --relative "${pkgdir}/usr/share/java/jdtls/bin/jdtls" "${pkgdir}/usr/bin/jdtls"
}
