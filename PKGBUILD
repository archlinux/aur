# Source: https://downloader.hytale.com/hytale-downloader.zip
# Maintainer: SCDevel <root@scdevel.net>

pkgname=hytale-downloader-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI tool for downloading Hytale assets"
arch=('x86_64')
options=('!strip' '!debug')
url="https://hytale.com"
license=('LicenseRef-custom')
depends=('glibc')
install=hytale-downloader.install
source=("https://downloader.hytale.com/hytale-downloader.zip"
        "LICENSE")

# Run 'updpkgsums' to generate these
sha256sums=('9878d5bd17a4654355d168f29c1434443298fdb9256e2f6ad736de9887c8d4bf'
            'f4fb44fd9db862c2a6f8fd3e242e783c1a6a2818406b68a74bb75aa4830ad835')

package() {
    # 1. Install the binary with a rename
    install -Dm755 "hytale-downloader-linux-amd64" "${pkgdir}/usr/bin/hytale-downloader"

    # 2. Install the documentation (QUICKSTART.md)
    install -Dm644 "QUICKSTART.md" "${pkgdir}/usr/share/doc/${pkgname}/QUICKSTART.md"

    # 3. Install the LICENSE file
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
