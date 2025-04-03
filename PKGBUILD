pkgname=biff-comsat-bin
pkgver=0.17
pkgrel=1
arch=('x86_64')
pkgdesc="Mail arrival notification daemon. Comsat incoming mail, biff requests notification."
url="https://mirrors.slackware.com/slackware/slackware64-current/slackware64/n/"
license=('custom')
depends=()
source=("https://slackware.uk/slackware/slackware64-15.0/slackware64/n/biff+comsat-0.17-x86_64-4.txz")
sha256sums=('SKIP') # Replace with actual checksum

prepare() {
    # Rename the downloaded file to match the expected filename
    mv "${srcdir}/biff+comsat-0.17-x86_64-4.txz" "${srcdir}/biff-comsat-0.17-x86_64-4.txz"
}

package() {
    # Extract the .txz file using tar
    tar -xf "${srcdir}/biff-comsat-0.17-x86_64-4.txz" -C "${pkgdir}/"

    # Remove unnecessary Slackware-specific install scripts
    rm -rf "${pkgdir}/install"

    install -Dm755 "${pkgdir}/usr/bin/biff" "${pkgdir}/usr/bin/biff"
    install -Dm755 "${pkgdir}/usr/sbin/in.comsat" "${pkgdir}/usr/sbin/in.comsat"
}
