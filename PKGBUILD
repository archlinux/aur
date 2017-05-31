# Maintainer: Daniel Holman <dholman@gymli.org>
pkgname=orphan-manager
pkgver=1.0
pkgrel=1
pkgdesc="Systemd timer to automatically remove orphaned packages"
arch=('any')
license=('MIT')
depends=('coreutils' 'systemd')
source=("orphan-manager"
        "orphan-manager.service"
        "orphan-manager.timer")
sha256sums=('32af05fcbee78a58ce8026fc42abf04286dd9e568eedb4343bcbae97de8803ca'
            '822c5314564143815bc2765cb3e7d33ca21ca2c17c0752eae34fc5e8610d17b6'
            '4c2c3936aca97ccf8269e8756a304a66743938d69337c3b097b0b92fc8a13855')

package() {
        mkdir -p "${pkgdir}/usr/lib/systemd/system/"
        mkdir -p "${pkgdir}/usr/bin/"

        cp "orphan-manager.service" "${pkgdir}/usr/lib/systemd/system/"
        cp "orphan-manager.timer" "${pkgdir}/usr/lib/systemd/system"
        chmod 644 "${pkgdir}/usr/lib/systemd/system/orphan-manager.service"
        chmod 644 "${pkgdir}/usr/lib/systemd/system/orphan-manager.timer"

        cp "orphan-manager" "${pkgdir}/usr/bin"
        chmod 755 "${pkgdir}/usr/bin/orphan-manager"
}
