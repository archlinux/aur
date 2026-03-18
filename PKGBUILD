# Maintainer: Tokyob0t <tokyob0t.business@proton.me>

pkgname=kernel-install-booster
pkgver=0.1.0
pkgrel=1
pkgdesc="Pacman hooks to integrate Booster-generated kernels with systemd-boot"
arch=('any')
license=('GPL3')
depends=('systemd' 'booster')
source=(
    "40-kernel-install-booster-remove.hook"
    "95-kernel-install-booster.hook"
    "kernel-install-booster-remove.sh"
    "kernel-install-booster.sh"
)
sha256sums=(
    '993e441c83c9a9f5d03d6c5e400b99321df035f6c701168a0d157504700b4f27'
    'c0589fe988d6f477c04cd2beba7d11c62745ec04460c29a91552721a7ec028d0'
    '9df8ebb31b1bd311e3fa9a5d90891cd05569f743a2aa62e57f7e7a2234842231'
    '9e1564ed2e87f19afd4ce89eddfe6ef8c8e1c8976c3940a02d42df14e93db68b'
)

package() {
    # hooks
    install -Dm644 40-kernel-install-booster-remove.hook "${pkgdir}/usr/share/libalpm/hooks/40-kernel-install-booster-remove.hook"
    install -Dm644 95-kernel-install-booster.hook "${pkgdir}/usr/share/libalpm/hooks/95-kernel-install-booster.hook"

    # scripts
    install -Dm755 kernel-install-booster-remove.sh "${pkgdir}/usr/share/libalpm/scripts/kernel-install-booster-remove"
    install -Dm755 kernel-install-booster.sh "${pkgdir}/usr/share/libalpm/scripts/kernel-install-booster"
}
