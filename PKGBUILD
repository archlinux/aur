pkgname=archive-editor-git
pkgver=0.1.0
pkgrel=2
pkgdesc="GTK4/libadwaita desktop app for managing ABSOLKING Archive entries and reviews"
arch=('x86_64')
url="https://github.com/AbsolKing/ArchiveEditor"
license=('MIT')
depends=('python' 'gtk4' 'libadwaita')
makedepends=('git')
source=("git+https://github.com/AbsolKing/ArchiveEditor.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/ArchiveEditor"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/archive-editor" <<'EOF'
#!/bin/sh
exec python3 /usr/share/archive-editor/main.py "$@"
EOF

    install -Dm644 src/main.py         "$pkgdir/usr/share/archive-editor/main.py"

    install -Dm644 src/application.py         "$pkgdir/usr/share/archive-editor/application.py"

    install -Dm644 src/window.py         "$pkgdir/usr/share/archive-editor/window.py"

    install -Dm644 src/archive_logic.py         "$pkgdir/usr/share/archive-editor/archive_logic.py"

    install -Dm644 io.github.absolking.ArchiveEditor.desktop         "$pkgdir/usr/share/applications/io.github.absolking.ArchiveEditor.desktop"

    install -Dm644 io.github.absolking.ArchiveEditor.metainfo.xml         "$pkgdir/usr/share/metainfo/io.github.absolking.ArchiveEditor.metainfo.xml"

    install -Dm644 io.github.absolking.ArchiveEditor.svg         "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.absolking.ArchiveEditor.svg"

    install -Dm644 LICENSE         "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
