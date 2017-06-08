# Maintainer: Daniel Holman <dholman@gymli.org>
pkgname=orphan-manager
pkgver=1.1
pkgrel=2
pkgdesc="Systemd timer to automatically remove orphaned packages"
arch=('any')
license=('MIT')
depends=('coreutils' 'systemd')
source=("orphan-manager"
        "orphan-manager.service"
        "orphan-manager.timer")
sha256sums=('32af05fcbee78a58ce8026fc42abf04286dd9e568eedb4343bcbae97de8803ca'
            '9e1d7c38797d29180c39b63b5ca71f437fdfbf42878a49e8e10c273c08baac5b'
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
