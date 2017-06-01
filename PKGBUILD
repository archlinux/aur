# Maintainer: Daniel Holman <dholman@gymli.org>
pkgname=orphan-manager
pkgver=1.0
pkgrel=3
pkgdesc="Systemd timer to automatically remove orphaned packages"
arch=('any')
license=('MIT')
depends=('coreutils' 'systemd')
source=("orphan-manager"
        "orphan-manager.service"
        "orphan-manager.timer")
sha256sums=('32af05fcbee78a58ce8026fc42abf04286dd9e568eedb4343bcbae97de8803ca'
            'e711f8c32c78460461e42e91eedce7752476cd5d6d4ac10ef01823197185afcd'
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
