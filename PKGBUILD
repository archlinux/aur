# Maintainer: Bjarne Øverli <bjarne@oever.li>
pkgname=aether
pkgver=4.0.1
pkgrel=1
pkgdesc='Desktop theming application - extract colors from wallpapers and apply cohesive themes'
arch=('x86_64')
url='https://github.com/bjarneo/aether'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
source=("aether-linux-amd64-${pkgver}::https://github.com/bjarneo/aether/releases/download/v${pkgver}/aether-linux-amd64"
        "aether-${pkgver}.tar.gz::https://github.com/bjarneo/aether/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5a9f9e85837dfc06e2eabd4acd442630823b247b530488f2f8bf6b7110d19ee4'
  'b249dda5610b14c66e26e82b4212718ab2f4f0c134bded133d7570dbff3d7386')
noextract=("aether-linux-amd64-${pkgver}")

package() {
    install -Dm755 "${srcdir}/aether-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/aether"

    cd "${srcdir}/aether-${pkgver}"
    install -Dm644 build/linux/aether.desktop "${pkgdir}/usr/share/applications/aether.desktop"
    install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/aether.png"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/aether/README.md"
}
