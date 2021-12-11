# Maintainer: James Devlin <devlin.ja@northeastern.edu>

pkgname=bustd-pacman-hooks
pkgver=0.1.0
pkgrel=1
pkgdesc="Series of Pacman Hooks to Ensure 'bustd' is Always Running an Up-to-Date Binary"
groups=("bustd")
depends=("bustd")

arch=("any")
license=("MIT")
url="https://github.com/vrmiguel/bustd"
source=("bustd-install.hook" "bustd-remove.hook" "bustd-upgrade.hook" "LICENSE")
sha1sums=("8dd6aad1156bd71cc02d5204caea8a58d717a030" "4e29dea1c62c217822cb966e3199d338fa342ccb" "997f826b14255fd627717f2826526a45b8a8f969" "ecc31cc12d89501688dcf6fa790e9ef162fa66d5")

# Just copies all the hooks
package() {
    # License
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"

    # Hooks
    for HOOK in "bustd-install.hook" "bustd-remove.hook" "bustd-upgrade.hook"; do
        install -Dm644 -t "${pkgdir}/etc/pacman.d/hooks" "${HOOK}"
    done
    # install -Dm644 -t "${pkgdir}/etc/pacman.d/hooks" "bustd-install.hook"
    # install -Dm644 -t "${pkgdir}/etc/pacman.d/hooks" "bustd-remove.hook"
    # install -Dm644 -t "${pkgdir}/etc/pacman.d/hooks" "bustd-upgrade.hook"
}
