# $Id: $
# Maintainer: David C. Rankin <drankinatty @ gmail.com>

pkgname=console-blanking
pkgver=0.0.1
pkgrel=3
pkgdesc="Restores virtual console default blanking and powerdown after a given number of minutes (defaults: blank monitor - 5 minutes, powerdown display = 6 minutes)."
url="https://github.com/drankinatty/console-blanking"
license=('GPL-2.0+')
provides=('console-blanking.service')
arch=('i686' 'x86_64')
options=('!emptydirs')
source=("console-blanking.service")
validpgpkeys=()
sha1sums=('3c09ef3b2f3d5b08b13ed9068e915fc52a797b82')

package() {
    cd "${srcdir}"
    install -d -m755 "${pkgdir}/usr/lib/systemd/system"
    install -m644 "console-blanking.service" "${pkgdir}/usr/lib/systemd/system"

    install -D -m644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
