pkgname="neovim-gtk"
_pkgname="neovim-gtk"
pkgdesc="GTK ui for neovim written in rust using gtk-rs bindings. With ligatures support."
pkgver=v0.1.1
pkgrel=1
depends=('gtk3')
arch=('x86_64' 'i686')
url="https://github.com/daa84/neovim-gtk"
license=('GPL3')
makedepends=('rust' 'cargo' 'git')
source=("$_pkgname::git+https://github.com/daa84/neovim-gtk.git")
sha256sums=('SKIP')

package() {
  cd "$_pkgname"

  env CARGO_INCREMENTAL=0 cargo build --release

  install -D -m755 "$srcdir/$_pkgname/target/release/nvim-gtk" \
                   "$pkgdir/usr/bin/nvim-gtk"

  install -D -m755 "$srcdir/$_pkgname/desktop/org.daa.NeovimGtk.desktop" \
                   "$pkgdir/usr/share/applications/org.daa.NeovimGtk.desktop"

  install -D -m755 "$srcdir/$_pkgname/desktop/org.daa.NeovimGtk.png" \
                   "$pkgdir/usr/share/pixmaps/org.daa.NeovimGtk.png"
}
