# $Id: $
# Maintainer: David C. Rankin <drankinatty @ gmail.com>

pkgname=console-blanking
pkgver=0.0.1
pkgrel=2
pkgdesc="Restores virtual console default blanking and powerdown after a given number of minutes (defaults: blank monitor - 5 minutes, powerdown display = 6 minutes)."
url="https://github.com/drankinatty/console-blanking"
license=('GPL-2.0+')
provides=('console-blanking.service')
arch=('i686' 'x86_64')
options=('!emptydirs')
source=("console-blanking.service"
        "LICENSE")
validpgpkeys=()
sha1sums=('d44bf879467bd107323f687406c8bdfd133d70dd'
        '4cc77b90af91e615a64ae04893fdffa7939db84c')

package() {
    cd "${srcdir}"
    install -d -m755 "${pkgdir}/usr/lib/systemd/system"
    install -m644 "console-blanking.service" "${pkgdir}/usr/lib/systemd/system"

    install -D -m644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
