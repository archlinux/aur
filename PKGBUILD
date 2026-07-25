# Maintainer: Paolo Mezzano Barahona <pmezzano@gmail.com>
pkgname=jisocreator-bin
pkgver=0.2.2
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
        "jisocreator.svg")
sha256sums=('8a7cc28d54344ed2d61c3e910c8f9eb644516af9eeb73b9c21ba3638715a313b'
            '5d2ab72c7d2c422ffadcb2e1f88f932a7943c89628781d653093d1efb4cc7a4e'
            '0879b9acff67b0f9113c8bb4b341678edcab8210e7155108708290c1163c1f20'
            'b29a5cbf04c0bc03b27d3cb7ec8592610a991a4d091a82cbc674cb89d90dcc9a')
validpgpkeys=('C66674F3E744D24235FD945F49E28787ECF14843')

package() {
    install -d "${pkgdir}/opt/jisocreator"
    install -d "${pkgdir}/usr/bin"
    cp -r "${srcdir}/lib" "${pkgdir}/opt/jisocreator/"
    install -m644 "${srcdir}/jisocreator.jar" "${pkgdir}/opt/jisocreator/"
    install -Dm644 "${srcdir}/jisocreator.svg" "${pkgdir}/usr/share/pixmaps/jisocreator.svg"
    install -Dm644 "${srcdir}/jisocreator.desktop" "${pkgdir}/usr/share/applications/jisocreator.desktop"
    install -Dm755 "${srcdir}/jisocreator.sh" "${pkgdir}/usr/bin/jisocreator"
}
