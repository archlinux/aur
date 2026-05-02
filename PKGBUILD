# Maintainer: Omi <pprrottonn@gmail.com>
pkgname=qnote
pkgver=0.2.8
pkgrel=1
pkgdesc="Minimal Tauri desktop note editor with Markdown support, PDF export, OCR, version history"
arch=('x86_64')
url="https://github.com/Omibranch/qnote"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'xdg-utils'
         'tesseract' 'tesseract-data-eng' 'tesseract-data-rus'
         'typst')
source=("${pkgname}-${pkgver}::https://github.com/Omibranch/qnote/releases/download/v${pkgver}/qnote-linux-x86_64")
sha256sums=('3199a4a8a8a33de49a04ff57d1b65b41de39c7a599b1f297f6a3744f3305335f')

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
