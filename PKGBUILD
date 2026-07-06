# Maintainer: Momwhyareyouhere <momwhyareyouhere51@gmail.com>

pkgname=patch-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="A lightweight code editor built with Electron, Monaco Editor, and React"
arch=('x86_64')
url="https://github.com/Momwhyareyouhere/Patch"
license=('MIT')
depends=('fuse2' 'libxss' 'libxtst' 'libxkbfile' 'nss' 'gtk3')
source=("https://github.com/Momwhyareyouhere/Patch/releases/download/v${pkgver}/Patch-${pkgver}.AppImage")
sha256sums=('SKIP')

package() {
  install -dm755 "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/Patch-${pkgver}.AppImage" "${pkgdir}/usr/bin/patch-editor"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/patch-editor.desktop" << EOF
[Desktop Entry]
Name=Patch
Comment=A lightweight code editor built with Electron, Monaco Editor, and React
Exec=patch-editor
Icon=patch-editor
Type=Application
StartupNotify=true
Categories=Development;TextEditor;
EOF
}
