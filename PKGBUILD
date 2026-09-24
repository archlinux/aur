# Maintainer: Riccardo Marotti
#
# Generated from packaging/aur-bin/PKGBUILD.in by
# scripts/generate-aur-bin-package.sh: do not edit the generated PKGBUILD by
# hand.

pkgname=gitilante-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A focused Git GUI for diffs, hunks and history (prebuilt binary)"
arch=('x86_64')
url="https://gitlab.com/rutilante/gitilante"
license=('GPL-3.0-or-later')
depends=(
    'git'
    'gtk4'
    'gtksourceview5'
    'libadwaita'
)
provides=("gitilante=$pkgver")
conflicts=('gitilante')
source=(
    "gitilante-$pkgver-linux-x86_64.tar.gz::https://gitlab.com/api/v4/projects/rutilante%2Fgitilante/packages/generic/gitilante/0.4.0/gitilante-0.4.0-linux-x86_64.tar.gz"
)
sha256sums=('9e249993df8a4d6df8ba1fd35b7cd837969be40cc69351086d8ec54afe009fe8')

package() {
    cd "$srcdir/gitilante-$pkgver-linux-x86_64"

    install -Dm755 bin/gitilante \
        "$pkgdir/usr/bin/gitilante"
    # Short command name.
    ln -s gitilante "$pkgdir/usr/bin/gila"
    install -Dm644 \
        share/applications/dev.gitilante.Gitilante.desktop \
        "$pkgdir/usr/share/applications/dev.gitilante.Gitilante.desktop"
    install -Dm644 \
        share/icons/hicolor/scalable/apps/dev.gitilante.Gitilante.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.gitilante.Gitilante.svg"
    install -Dm644 \
        share/metainfo/dev.gitilante.Gitilante.metainfo.xml \
        "$pkgdir/usr/share/metainfo/dev.gitilante.Gitilante.metainfo.xml"
}
