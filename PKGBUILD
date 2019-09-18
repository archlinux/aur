# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=mkinitcpio-tpm2-encrypt
pkgver=1.4.0
pkgrel=1
pkgdesc="mkinitcpio hook that decrypts a TPM2-sealed LUKS keyfile"
url="https://aur.archlinux.org/packages/mkinitcpio-tpm2-encrypt/"
arch=(any)
license=('GPL3')
depends=('mkinitcpio' 'tpm2-tools>=4.0')
source=('install_tpm2'
        'hook_tpm2'
        'README.md')
sha256sums=('cb5c9acca16a5ad8d2dbee8aa70f590d57236a0e5ccd0869b770b4535018b2ae'
            '2dcdcfd37ab3ba23d30e0a6bd2c5ae8f93f0e64b8d410ab6a21333bca8392cce'
            '63c62e0ac9cd1bfc8c7f08b8807b6e8a0bd874c24c7337acab737f40242e594f')

package() {
    install -Dm644 install_tpm2 "${pkgdir}/usr/lib/initcpio/install/tpm2"
    install -Dm644 hook_tpm2 "${pkgdir}/usr/lib/initcpio/hooks/tpm2"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
