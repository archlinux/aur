# Maintainer: Omi <pprrottonn@gmail.com>
pkgname=qnote
pkgver=0.2.1
pkgrel=1
pkgdesc="Minimal Tauri desktop note editor with Markdown support, PDF export, OCR, version history"
arch=('x86_64')
url="https://github.com/Omibranch/qnote"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'xdg-utils')
optdepends=('typst: PDF export'
            'tesseract: OCR text extraction from images'
            'tesseract-data-eng: English OCR language data'
            'tesseract-data-rus: Russian OCR language data')
source=("${pkgname}-${pkgver}::https://github.com/Omibranch/qnote/releases/download/v${pkgver}/qnote-linux-x86_64")
sha256sums=('0c84b4f96dbbbcae129dd81f9af1519f4695e649f54fa7c01c3b2790cb4b50ff')

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
