# Maintainer: Daniel Holman <dholman@gymli.org>
pkgname=orphan-manager
pkgver=1.1
pkgrel=1
pkgdesc="Systemd timer to automatically remove orphaned packages"
arch=('any')
license=('MIT')
depends=('coreutils' 'systemd')
source=("orphan-manager"
        "orphan-manager.service"
        "orphan-manager.timer")
sha256sums=('32af05fcbee78a58ce8026fc42abf04286dd9e568eedb4343bcbae97de8803ca'
            'd40b088efab2975140e73f2258af13dd24ba1c9cdbb7a8e661f560110d9041ac'
            'c83f75c00465597b0704a4842000c5db266e5cf8a6c124d5407f7bd9e92b35dd')

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
