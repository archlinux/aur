# Maintainer: Polochon_street <polochonstreet at gmx dot fr>
pkgname=blissify-git
_gitname=blissify-rs
pkgver=0.1.6
pkgrel=2
pkgdesc="A tool to analyze an MPD audio library and make smart playlists"
arch=('x86_64')
url="https://github.com/Polochon-street/blissify-rs"
license=('GPL')
depends=()
makedepends=('cargo' 'nasm' 'clang')
options=('!lto')
source=("git://github.com/Polochon-street/blissify-rs")
sha512sums=('SKIP')

build() {
  cd "$_gitname"

  cargo build --release --locked
}

check() {
  cd "$_gitname"

  cargo test --release --locked
}

package() {
   cd "$_gitname"
   install -Dm 755 target/release/blissify -t "${pkgdir}/usr/bin"
}
