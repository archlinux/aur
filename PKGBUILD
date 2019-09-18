# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=mkinitcpio-tpm2-encrypt
pkgver=1.4.0
pkgrel=2
pkgdesc="mkinitcpio hook that decrypts a TPM2-sealed LUKS keyfile"
url="https://github.com/electrickite/mkinitcpio-tpm2-encrypt"
arch=(any)
license=('GPL3')
depends=('mkinitcpio' 'tpm2-tools>=4.0')
source=("https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('6364f9311db3ccbc5c15e02efe3b5c81bcaeed1002cf9ee40b2a63eaa77d08c0')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm644 install_tpm2 "${pkgdir}/usr/lib/initcpio/install/tpm2"
    install -Dm644 hook_tpm2 "${pkgdir}/usr/lib/initcpio/hooks/tpm2"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
