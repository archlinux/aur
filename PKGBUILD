pkgname=biff-comsat-bin
pkgver=0.17
pkgrel=1
arch=('x86_64')
pkgdesc="Mail arrival notification daemon. Comsat incoming mail, biff requests notification."
url="https://mirrors.slackware.com/slackware/slackware64-current/slackware64/n/"
license=('custom')
depends=()
source=("${url}/${pkgname}-${pkgver}-x86_64-4.txz")
sha256sums=('SKIP') # Replace with actual checksum

package() {
    tar --extract --xz --file "${srcdir}/${pkgname}-${pkgver}-x86_64-4.txz" -C "${pkgdir}/"

    # Remove unnecessary Slackware-specific install scripts
    rm -rf "${pkgdir}/install"

    # Ensure correct permissions
    chmod 755 "${pkgdir}/usr/bin/biff"
    chmod 755 "${pkgdir}/usr/sbin/in.comsat"
}

