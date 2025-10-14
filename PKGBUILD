# Maintainer: Barones Project
pkgname=barones-free-space-cleaner
pkgver=1.0.1
pkgrel=1
pkgdesc="Secure free space deletion tool for Linux"
arch=('any')
url="https://github.com/Mad-scientist-star/Barones-Free-Space-Cleaner"
license=('MIT')
depends=('python' 'python-gobject' 'gtk3')
optdepends=('smartmontools: for drive health monitoring')
source=("https://github.com/Mad-scientist-star/Barones-Free-Space-Cleaner/archive/refs/tags/v${pkgver}.tar.gz"
        "barones-free-space-cleaner.desktop"
        "logo_48.png"
        "logo_64.png"
        "logo_128.png"
        "logo_256.png")
sha256sums=('854afa2f63c273aff86281bf8fbe8153a46b2c953733e0bfe0e2f65e8f767b21'
            'cc1b2c047bd83768c77745360c03e04813756c9c5a91b7f3b90d17c246faa2e6'
            'a3290381f7ab8d33fd106fad887c6564febb3f4f8a1a23a29bd406f0b52f1827'
            '8ef243a5077b777a19e6534d8f1d7a9702632167da0b5fa9307fcc446c2aad70'
            'f3a6ee7fa5b8abde15e14dbcdbf2ac0fe5c33613cccf55265e3ebb0d4706b933'
            'd07536e96873290c2e5112355972a45c0334f14ddccb1c92b0ec0e469c382344')

package() {
    cd "${srcdir}/Barones-Free-Space-Cleaner-${pkgver}"
    
    # Install the main script
    install -Dm755 free-space-wipe.py "${pkgdir}/usr/bin/barones-free-space-cleaner"
    
    # Install desktop file
    install -Dm644 "${srcdir}/barones-free-space-cleaner.desktop" \
        "${pkgdir}/usr/share/applications/barones-free-space-cleaner.desktop"
    
    # Install icons
    install -Dm644 "${srcdir}/logo_48.png" \
        "${pkgdir}/usr/share/icons/hicolor/48x48/apps/barones-free-space-cleaner.png"
    install -Dm644 "${srcdir}/logo_64.png" \
        "${pkgdir}/usr/share/icons/hicolor/64x64/apps/barones-free-space-cleaner.png"
    install -Dm644 "${srcdir}/logo_128.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/barones-free-space-cleaner.png"
    install -Dm644 "${srcdir}/logo_256.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/barones-free-space-cleaner.png"
    install -Dm644 "${srcdir}/logo_48.png" \
        "${pkgdir}/usr/share/pixmaps/barones-free-space-cleaner.png"
    
    # Install README
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

