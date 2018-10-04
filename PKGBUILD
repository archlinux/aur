# Maintainer: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>

pkgname=mkinitcpio-tpm2-encrypt
pkgver=1.0
pkgrel=1
pkgdesc="mkinitcpio hook that decrypts a TPM2-sealed LUKS keyfile"
url="https://aur.archlinux.org/packages/mkinitcpio-tpm2-encrypt/"
arch=(any)
license=('GPL3')
depends=('mkinitcpio' 'tpm2-tools')
source=('install_tpm2'
        'hook_tpm2'
        'README.md')
sha256sums=('43139f076c03ca147d8bf368b98bdd6b237ab927e53194feb944f58e38914901'
            'f1cd4ec3197ec4843265e0d61518f641a0dbd650c42cf0399cace0076163fc7c'
            '11585844eb33ce997e55087dbec0610693bd79e3b1ffb02c9818214ce401a9fb')

package() {
    install -Dm644 install_tpm2 "${pkgdir}/usr/lib/initcpio/install/tpm2"
    install -Dm644 hook_tpm2 "${pkgdir}/usr/lib/initcpio/hooks/tpm2"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
