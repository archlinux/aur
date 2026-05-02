# Maintainer: Omi <pprrottonn@gmail.com>
pkgname=qnote
pkgver=0.2.11
pkgrel=1
pkgdesc="Minimal Tauri desktop note editor with Markdown support, PDF export, OCR, version history"
arch=('x86_64')
url="https://github.com/Omibranch/qnote"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'xdg-utils'
         'tesseract' 'tesseract-data-eng' 'tesseract-data-rus'
         'typst')
source=("${pkgname}-${pkgver}::https://github.com/Omibranch/qnote/releases/download/v${pkgver}/qnote-linux-x86_64")
sha256sums=('a30ec5f7db0da6c1c302c4664df5aaa035fa2f3cffc5bbd3a1cf64d38fbab8f4')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=qnote
Comment=Minimal note editor with Markdown support
Exec=${pkgname}
Icon=text-editor
Type=Application
Categories=Office;TextEditor;
Keywords=notes;markdown;editor;text;
EOF
}
