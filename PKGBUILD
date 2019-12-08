# Maintainer: Varakh <varakh@varakh.de>

pkgname=cells-sync-bin
pkgver=0.9.1
pkgrel=1
conflicts=('cells-sync')
provides=('cells-sync')
arch=('x86_64')
license=('GPL3')
pkgdesc="Cells Sync is a desktop synchronization client for Pydio Cells server"
url="https://pyd.io"
source=("$pkgname-$pkgver.zip::https://download.pydio.com/pub/cells-sync/release/${pkgver}/linux-amd64/pydio-cells-sync-${pkgver}-linux-amd64.zip" "cells-sync.service" "cells-sync-bin.png" "cells-sync-bin.desktop" "cells-sync-bin-ui-launcher.sh")
sha256sums=('3b85330ab1ee609e7521851ea873e95aefa2c2ae757693a527fad3830a2539b2'
            '794be4d5d718a21c485783925c878a418b4dd224a9bd5cef8814a0036ee61ef9'
            'e2c25fc97474a77c7dd450663084bf3916ff1c9b869061cb6b02e9c3cd121ef7'
            '2586bed5ad085619428d22495b4aed16f828d68fe368a006bb20bffb588da068'
            '7b47fb1944fe84db4130bb87b52344e02e7e063045519ddd7f0acd049a34917f')

package() {
    install -D -m 755 cells-sync "${pkgdir}/usr/bin/cells-sync"
    install -D -m644 "${srcdir}/cells-sync.service" "${pkgdir}/usr/lib/systemd/user/cells-sync.service"
    install -D -m644 "${srcdir}/cells-sync-bin.png" "${pkgdir}/usr/share/icons/cells-sync-bin.png"
    install -D -m644 "${srcdir}/cells-sync-bin.desktop" "${pkgdir}/usr/share/applications/cells-sync-bin.desktop"
    install -D -m644 "${srcdir}/cells-sync-bin-ui-launcher.sh" "${pkgdir}/usr/bin/cells-sync-bin-ui-launcher.sh"
}
