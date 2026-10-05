# Maintainer: Kazi Rifat Morshed <kazirifatmorshed@gmail.com>
pkgname=mass-certificate-generator-bin
pkgver=1.1.0
_tag="v1.1"
pkgrel=2
pkgdesc="Batch certificate generator with custom fonts, layouts, and CSV/Excel data (standalone binary)"
arch=('x86_64')
url="https://github.com/KaziRifatMorshed/Mass-Certificate-Generator-MCG-gh-Public"
license=('Apache-2.0')
depends=('glibc' 'fontconfig' 'hicolor-icon-theme')
provides=('mass-certificate-generator')
conflicts=('mass-certificate-generator')
source=("https://github.com/KaziRifatMorshed/Mass-Certificate-Generator-MCG-gh-Public/releases/download/${_tag}/MassCertificateGenerator-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('aadd824d7d7dc1c000a2d2230bf72aa570b8152e440d5fbfe0f080478c026cd7')

package() {
    cd "MassCertificateGenerator-v${pkgver}-linux-x86_64"

    # Install executable
    install -Dm755 MassCertificateGenerator "${pkgdir}/usr/bin/MassCertificateGenerator"
    ln -sf /usr/bin/MassCertificateGenerator "${pkgdir}/usr/bin/mass-certificate-generator"

    # Install desktop entry
    install -Dm644 MassCertificateGenerator.desktop "${pkgdir}/usr/share/applications/mass-certificate-generator.desktop"

    # Install application icon
    install -Dm644 MCG_logo.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/mass-certificate-generator.png"
}
