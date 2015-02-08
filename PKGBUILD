# Maintainer: Slash <demodevil5atyahoodotcom>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>

pkgname=doom3-inhell
pkgver=1.1dc
pkgrel=1
pkgdesc='Doom3 mod inspired by the classic "Ultimate Doom"'
arch=('any')
url="http://doom3.filefront.com/file/;83607"
license=('unknown')
depends=('bash' 'doom3')
source=(
    "http://oxygen4.free.fr/dl/in_hell-${pkgver}.tar.lzma"
    "${pkgname}.sh"
    "${pkgname}.png"
    "${pkgname}.desktop"
)
sha256sums=('4f930d1256716e9b6b57cffcb1cf764837efa10dfc9ac724e9221a51d9987e46'
            '985a380a774652b4497d1385d89d5db05eef57003074a7683f6d8f6941e4186d'
            '51e8a9477ae217498a41e5f8c5145d45a214027d7100b529a42e743bcb8f7b6f'
            'dec1460a8b848c01d0d38006d2b3e1c1cb041bf087043b7c18eca51035420ce6')
PKGEXT='.pkg.tar'

package() {
    # Create destination directory
    install -d "${pkgdir}/opt/doom3"

    # Copy data to destination
    cp -rf "in_hell-${pkgver}"/ \
        "${pkgdir}/opt/doom3/in_hell/"

    # Install Icon file
    install -D -m 0644 "${srcdir}/${pkgname}.png" \
        "$pkgdir/usr/share/pixmaps/${pkgname}.png"

    # Install Desktop file
    install -D -m 0644 "${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install Launcher
    install -D -m 0755 "${srcdir}/${pkgname}.sh" \
        "${pkgdir}/usr/bin/${pkgname}"
}
