# Maintainer: Jack Dähn <jack dot daehn at gmail dot com>
# Contributor: Matthew Prenger <matt at prenger dot co>

pkgname=bytecode-viewer
pkgver=2.9.20
pkgrel=1
pkgdesc="A Java decompiler, editor, debugger, and more"
url="https://bytecodeviewer.com"
arch=(any)
license=('GPL3')
depends=('java-runtime>=8')
source=(
    "bytecodeviewer"
    "bytecodeviewer.png"
    "bytecodeviewer.desktop"
    "https://github.com/Konloch/bytecode-viewer/releases/download/v${pkgver}/Bytecode-Viewer-${pkgver}.jar"
)
noextract=(
    "Bytecode-Viewer-${pkgver}.jar"
)
sha256sums=(
    '6c40ed470b3fc9aa0ee585ef71d86c8a822877e832d406ea365ce3b279e9f95c'
    '380fbc2d958fc5e0c3f7c05b21de83e3d7e956b00ab476439f893f1d10a61a3e'
    '8db5427005732dfe6d590d31209ee0108d6ebf62f084e4bd67bdd175b7dc47d7'
    'a74fa6a6b39fd720d78e2557a3b3f9f4b6f70156b29aaffa92b17c86dd86d1a4'
)

package() {
    cd "$srcdir"

    install -D -m755 "${srcdir}/bytecodeviewer" "${pkgdir}/usr/bin/bytecodeviewer"
    install -D -m644 "${srcdir}/Bytecode-Viewer-${pkgver}.jar" "${pkgdir}/usr/share/java/bytecodeviewer/bytecodeviewer.jar"
    install -D -m644 "${srcdir}/bytecodeviewer.desktop" "${pkgdir}/usr/share/applications/bytecodeviewer.desktop"
    install -D -m644 "${srcdir}/bytecodeviewer.png" "${pkgdir}/usr/share/pixmaps/bytecodeviewer.png"
}
