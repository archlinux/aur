# Maintainer: Mikael Blomstrand <mbloms ÅT kth DÖT se>
# Contributor: Tobias Umbach <tobias@fastmail.mx>
# Contributor: Wesley Moore <wes@wezm.net>

pkgname=neovim-gtk
pkgver=0.1.1
pkgrel=4
pkgdesc='GTK UI for Neovim written in Rust'
arch=('i686' 'x86_64')
url="https://github.com/daa84/neovim-gtk"
license=('GPL3')
depends=('neovim' 'gtk3' 'vte3' 'ttf-dejavu')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/daa84/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('43c9a7bc2f57e7fddb98a7304dc078a5')
sha1sums=('c50cd86c4b121de46f1f309a64fa903079ce9328')
sha256sums=('a5c64cbbf3089b76fc24e590967752d8c02eec90b8999e409630ab8fa290b8c2')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/nvim-gtk" "${pkgdir}/usr/bin/nvim-gtk"
  install -Dm644 "desktop/nvim-gtk.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/nvim-gtk.png"
  install -Dm644 "desktop/nvim-gtk.desktop" "${pkgdir}/usr/share/applications/nvim-gtk.desktop"
}
