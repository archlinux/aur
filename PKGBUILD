# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=daftar-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A native GTK app and a command line for an Obsidian vault in a Git repository"
arch=(x86_64)
url="https://github.com/parham-alvani/notes-linux"
license=('GPL-3.0-only')
depends=(gtk4 libadwaita webkitgtk-6.0 gtksourceview5 vte4 pango cairo glib2 graphene libsoup3 gcc-libs glibc)
optdepends=('git: syncing the vault'
            'neovim: the Neovim editing mode'
            'librsvg: SVG pictures in the editor'
            'webp-pixbuf-loader: WebP pictures in the editor'
            'libavif: AVIF pictures in the editor')
provides=('daftar' 'daftar-cli')
conflicts=('daftar' 'daftar-cli' 'daftar-cli-bin')
source=("https://github.com/parham-alvani/notes-linux/releases/download/v${pkgver}/daftar-${pkgver}-x86_64.tar.gz"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/parham-alvani/notes-linux/v${pkgver}/LICENSE")
sha256sums=('27fe66728b9ab36ffd71597155ac80444b75b1117ac8fc36a4f7be7c708b3703'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm755 daftar "$pkgdir/usr/bin/daftar"
  install -Dm755 daftar-cli "$pkgdir/usr/bin/daftar-cli"
  install -Dm644 me.parham1995.notes.desktop "$pkgdir/usr/share/applications/me.parham1995.notes.desktop"
  install -Dm644 me.parham1995.notes.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/me.parham1995.notes.png"
  install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
