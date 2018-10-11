# Maintainer: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>

pkgname=mkinitcpio-tpm2-encrypt
pkgver=1.2
pkgrel=1
pkgdesc="mkinitcpio hook that decrypts a TPM2-sealed LUKS keyfile"
url="https://aur.archlinux.org/packages/mkinitcpio-tpm2-encrypt/"
arch=(any)
license=('GPL3')
depends=('mkinitcpio' 'tpm2-tools')
source=('install_tpm2'
        'hook_tpm2'
        'README.md')
sha256sums=('baf4e8d7a5385bdc5dda1a4b8148da510c35d632f27470951ab84c8c82b2e554'
            '93f1fb0ac7539480d434ee76ccbef1f0953e15d6700be8be67273c5bfaeb79dd'
            '153e368c88f6ad45befc6593c7b00995f1656674149d8ec55659ebd6a91a1a51')

package() {
    install -Dm644 install_tpm2 "${pkgdir}/usr/lib/initcpio/install/tpm2"
    install -Dm644 hook_tpm2 "${pkgdir}/usr/lib/initcpio/hooks/tpm2"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
