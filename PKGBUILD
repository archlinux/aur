pkgname=scurl-download
pkgver=1.0
pkgrel=0
pkgdesc="Simply adds --curl-options=--tlsv1.3 to all wcurl instances to enforce strong encryption"
arch=('any')
license=('GPL3')
source=() 
sha256sums=()
depends=('curl')
TARGET_FILE="/usr/local/bin/scurl-download"
SCRIPT_CONTENT='wcurl --curl-options=--tlsv1.3 "$@"'
package() {
    install -d "${pkgdir}/usr/local/bin"
    echo "${SCRIPT_CONTENT}" > "${pkgdir}/${TARGET_FILE}"
    chmod +x "${pkgdir}/${TARGET_FILE}" 
}

uninstall() {
    :
}
