# Source: https://downloader.hytale.com/hytale-downloader.zip
# Maintainer: SCDevel <root@scdevel.net>

pkgname=hytale-downloader-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="CLI tool for downloading Hytale assets"
url="https://hytale.com"
license=('LicenseRef-custom')
arch=('x86_64')
options=('!strip' '!debug')
provides=('hytale-downloader')
conflicts=('hytale-downloader')
depends=("bash")
optdepends=('jdk25-openjdk: Required to Run / Mod Hytale client/server'
            'jre25-openjdk: Required to Run Hytale client/server')
install=hytale-downloader.install
source=("hytale-downloader-${pkgver}.zip::https://downloader.hytale.com/hytale-downloader.zip"
        "hytale-downloader.install"
        "hytale-downloader.sh"
        "LICENSE")

# Run 'updpkgsums' to generate these
sha256sums=('9878d5bd17a4654355d168f29c1434443298fdb9256e2f6ad736de9887c8d4bf'
            '405bfc7bb35098b085bb7d5be1521b4caa7a9bc81fd6be53f7a72a4986635845'
            '0b9a6f35167179315f07ea6ae2b566a916741c996aa296aeb3fd9d7759e60b46'
            'f4fb44fd9db862c2a6f8fd3e242e783c1a6a2818406b68a74bb75aa4830ad835')

package() {
    # 1. Install the binary with a rename
    install -Dm755 "${srcdir}/hytale-downloader-linux-amd64" "${pkgdir}/opt/${pkgname}/hytale-downloader"
    install -Dm755 "${srcdir}/hytale-downloader.sh" "${pkgdir}/usr/bin/hytale-downloader"

    # 2. Install the documentation (QUICKSTART.md)
    install -Dm644 "QUICKSTART.md" "${pkgdir}/usr/share/doc/${pkgname}/QUICKSTART.md"

    # 3. Install the LICENSE file
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
