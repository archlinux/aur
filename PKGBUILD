# Maintainer: Paolo Mezzano Barahona <pmezzano@gmail.com>
pkgname=jisocreator-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="JIsoCreator is a ISO9660 CD Image creator, frontend of MKISOFS"
arch=('x86_64')
url="https://github.com/Cavallinux/jisocreator"
license=('GPL3')
depends=('java-runtime>=21' 'gtk3' 'cdrtools')
provides=('jisocreator')
conflicts=('jisocreator')
source=("https://github.com/Cavallinux/jisocreator/releases/download/v${pkgver}/jisocreator-${pkgver}-gtk.linux.x86_64.zip"
        "jisocreator.desktop"
        "jisocreator.sh"
        "jisocreator.png")
sha256sums=('6e6ee46795d832fc66b58342fc69af953fa9bb06b823277cd9e90e259d67f121'
            '5d2ab72c7d2c422ffadcb2e1f88f932a7943c89628781d653093d1efb4cc7a4e'
            'eedd19de2e0b9eb87791b6b4fd45f94cbd98a36e7fc56b1086a288480a821962'
            'b662235eed256debee97df87331dd91abc359f05016b14ba562a78f1becca2b7')

package() {
    install -d "${pkgdir}/opt/jisocreator"
    install -d "${pkgdir}/usr/bin"
    cp -r "${srcdir}/lib" "${pkgdir}/opt/jisocreator/"
    install -m644 "${srcdir}/jisocreator.jar" "${pkgdir}/opt/jisocreator/"
    install -Dm644 "${srcdir}/jisocreator.png" "${pkgdir}/usr/share/pixmaps/jisocreator.png"
    install -Dm644 "${srcdir}/jisocreator.desktop" "${pkgdir}/usr/share/applications/jisocreator.desktop"
    install -Dm755 "${srcdir}/jisocreator.sh" "${pkgdir}/usr/bin/jisocreator"
}
