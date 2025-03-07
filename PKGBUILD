# Maintainer: Jujstme <just.tribe at gmail dot com>

pkgname=unleashedrecomp-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="An unofficial PC port of the Xbox 360 version of Sonic Unleashed created through the process of static recompilation"
arch=('x86_64')
url="https://github.com/Jujstme/UnleashedRecomp"
license=('GPL3')
depends=(
  'gtk3'
  'glib2'
  'pango'
  'harfbuzz'
  'cairo'
  'pixman'
  'libx11'
  'libxext'
  'gcc-libs'
  'glibc'
  'zlib'
  'freetype2'
  'fontconfig'
  'vulkan-driver'
)
optdepends=(
  'at-spi2-core: Accessibility support'
  'libcloudproviders: Cloud storage integration'
  'libxinerama: Multi-monitor support'
  'libxrandr: Screen resizing support'
  'libxcursor: Cursor theming'
  'libxdamage: Graphics optimizations'
  'wayland: Wayland support'
  'sqlite: Embedded database support'
  'json-glib: JSON parsing'
  'brotli: Brotli compression support'
  'bzip2: Support for .bz2 compressed files'
  'zstd: Support for Zstandard compressed files'
  'libjpeg-turbo: JPEG image support'
  'libtiff: TIFF image support'
  'graphite: Advanced text rendering'
  'libthai: Thai language support'
)
source=(
  "https://github.com/Jujstme/UnleashedRecomp/releases/download/1.0.2/UnleashedRecomp.zip"
  "https://raw.githubusercontent.com/hedge-dev/UnleashedRecompResources/e5a4adccb30734321ac17347090abeb6690dab70/images/game_icon.png"
)
sha256sums=(
'199c8462f0c6ab4ae42ce45a77cc3f6d7bd1301ce44d9d9584bd77e618478e80'
'6d9fe76d8e6573acf537388bde3cc1495d2920dc350950186581c80e83faf42d'
)

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  cp "UnleashedRecomp" "${pkgdir}/usr/bin/UnleashedRecomp"
  mkdir -p "${pkgdir}/usr/share/applications"
  
  # And we set up the .desktop file
  cat > "${pkgdir}/usr/share/applications/unleashedrecomp.desktop" << EOF
[Desktop Entry]
Type=Application
Name=Unleashed Recompiled
Comment=Static recompilation of Sonic Unleashed
TryExec=UnleashedRecomp
Exec=UnleashedRecomp
Icon=unleashedrecomp
Terminal=false
Categories=Game;
MimeType=x-scheme-handler/unleashedrecomp
EOF

  mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  cp "game_icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/unleashedrecomp.png"
}
