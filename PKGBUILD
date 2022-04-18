# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jack Dähn <jack dot daehn at gmail dot com>
# Contributor: Matthew Prenger <matt at prenger dot co>

set -u
pkgname='bytecode-viewer'
pkgver='2.11.2'
pkgrel='1'
pkgdesc='A Java decompiler, editor, debugger, and more'
url='https://bytecodeviewer.com'
arch=('any')
license=('GPL3')
depends=('java-runtime>=8')
optdepends=('graal')
source=(
  "https://github.com/Konloch/bytecode-viewer/releases/download/v${pkgver}/Bytecode-Viewer-${pkgver}.jar"
  'bytecodeviewer'
  'bytecodeviewer.png'
  'bytecodeviewer.desktop'
)
noextract=("${source[0]##*/}")
md5sums=('00b9f89bc18fad1d87f6723c0be80e8b'
         '86f6d2d12561d7098343954b5e73f0c3'
         'a3d3b9e14f92bdd44febe05d9981a685'
         'bb4cf22a28611b6b3a684ad1d0567c08')
sha256sums=('536ad387424106083f76cd0cb7c051a22aff21f08663ba2539c11f1ddef9147f'
            'fd1d7b95daaff6221904e76663fdb629ac15fe3737add0016729afeb07a19acd'
            '380fbc2d958fc5e0c3f7c05b21de83e3d7e956b00ab476439f893f1d10a61a3e'
            '24a537c7e5e727457007d75b49d731ae41ad2d355a806553a52cc111f80ecd53')

package() {
  set -u
  install -Dpm755 'bytecodeviewer' -t "${pkgdir}/usr/bin/"
  install -Dpm644 "Bytecode-Viewer-${pkgver}.jar" "${pkgdir}/usr/share/java/bytecodeviewer/bytecodeviewer.jar"
  install -Dpm644 'bytecodeviewer.desktop' -t "${pkgdir}/usr/share/applications/"
  install -Dpm644 'bytecodeviewer.png' -t "${pkgdir}/usr/share/pixmaps/"
  set +u
}
set +u
