# Maintainer : elzadam11@tutamail.com

pkgname=fontviwer3000
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple font viewer using SDL2 and SDL2_ttf"
arch=('x86_64')
license=('ZLIB')
depends=('sdl2' 'sdl2_ttf')
makedepends=('gcc' 'make')
source=("main.c" "Makefile" "LICENSE" "fontviewer3000.desktop")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
  make
}

package() {
  # Binaire
  install -Dm755 fontViwer3000 "$pkgdir/usr/bin/fontViwer3000"
  
  # Licence
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Fichier .desktop
  install -Dm644 fontviwer3000.desktop "$pkgdir/usr/share/applications/fontviwer3000.desktop"

  # MIME types (optionnel mais recommandé)
  mkdir -p "$pkgdir/usr/share/mime/packages"
  cat > "$pkgdir/usr/share/mime/packages/fontviwer3000.xml" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
    <mime-type type="application/x-font-ttf">
        <comment>TrueType Font</comment>
        <glob pattern="*.ttf"/>
    </mime-type>
    <mime-type type="application/x-font-opentype">
        <comment>OpenType Font</comment>
        <glob pattern="*.otf"/>
    </mime-type>
</mime-info>
EOF
}

validpgpkeys=(
        61935d4c56db8559c95c175fab25dde26d490c2d
)

