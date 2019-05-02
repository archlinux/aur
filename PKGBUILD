# Maintainer: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>

pkgname=mkinitcpio-tpm2-encrypt
pkgver=1.3.0
pkgrel=1
pkgdesc="mkinitcpio hook that decrypts a TPM2-sealed LUKS keyfile"
url="https://aur.archlinux.org/packages/mkinitcpio-tpm2-encrypt/"
arch=(any)
license=('GPL3')
depends=('mkinitcpio' 'tpm2-tools')
source=('install_tpm2'
        'hook_tpm2'
        'README.md')
sha256sums=('cb5c9acca16a5ad8d2dbee8aa70f590d57236a0e5ccd0869b770b4535018b2ae'
            '6886463391529bd42d391cbaa4b202535c44302c6971597dcfbd9371844c3638'
            '2342a3330b08cf4825c33bc4c26358ee6ef15bfddd9ce517b02a9538dab381a3')

package() {
    install -Dm644 install_tpm2 "${pkgdir}/usr/lib/initcpio/install/tpm2"
    install -Dm644 hook_tpm2 "${pkgdir}/usr/lib/initcpio/hooks/tpm2"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
