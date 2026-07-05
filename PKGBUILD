# Maintainer: Paolo Mezzano Barahona <pmezzano@gmail.com>
pkgname=jisocreator-bin
pkgver=0.1.6
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
sha256sums=('f8235dc874fe03b84b2616a1b3b8603689ad4ffc676af1c84f5146edb60d5e6c'
            '5d2ab72c7d2c422ffadcb2e1f88f932a7943c89628781d653093d1efb4cc7a4e'
            '0879b9acff67b0f9113c8bb4b341678edcab8210e7155108708290c1163c1f20'
            'b662235eed256debee97df87331dd91abc359f05016b14ba562a78f1becca2b7')
validpgpkeys=('C66674F3E744D24235FD945F49E28787ECF14843')

package() {
    install -d "${pkgdir}/opt/jisocreator"
    install -d "${pkgdir}/usr/bin"
    cp -r "${srcdir}/lib" "${pkgdir}/opt/jisocreator/"
    install -m644 "${srcdir}/jisocreator.jar" "${pkgdir}/opt/jisocreator/"
    install -Dm644 "${srcdir}/jisocreator.png" "${pkgdir}/usr/share/pixmaps/jisocreator.png"
    install -Dm644 "${srcdir}/jisocreator.desktop" "${pkgdir}/usr/share/applications/jisocreator.desktop"
    install -Dm755 "${srcdir}/jisocreator.sh" "${pkgdir}/usr/bin/jisocreator"
}
