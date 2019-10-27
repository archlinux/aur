# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=mkinitcpio-tpm2-encrypt
pkgver=1.5.0
pkgrel=1
pkgdesc="mkinitcpio hook that decrypts a TPM2-sealed LUKS keyfile"
url="https://github.com/electrickite/mkinitcpio-tpm2-encrypt"
arch=(any)
license=('GPL3')
depends=('mkinitcpio' 'tpm2-tools>=4.0')
source=("https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1d33a42744927f6aad8960b0cec888b6fc3e78d1e6f856c948e1d0e0c2615f24')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm644 install_tpm2 "${pkgdir}/usr/lib/initcpio/install/tpm2"
    install -Dm644 hook_tpm2 "${pkgdir}/usr/lib/initcpio/hooks/tpm2"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
