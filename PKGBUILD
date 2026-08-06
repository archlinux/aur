# Maintainer: tryashtar <tryashtar@gmail.com>
pkgname=minecraft-ttf-git
pkgver=1.4.4.g1e9d64c
pkgrel=1
pkgdesc="Pixel-accurate and complete TrueType fonts from Minecraft: Java Edition, generated automatically from the latest version of the game"
url="https://github.com/tryashtar/minecraft-ttf"
license=("custom")
arch=("any")
depends=()
makedepends=("git" "uv")
source=("git+https://github.com/tryashtar/minecraft-ttf.git")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/minecraft-ttf"
    git describe --tags --always | sed -e 's|^v||;s|-|.|g'
}

build() {
   cd "$srcdir/minecraft-ttf"
   uv run src/main.py
}

package() {
   install -Dm644 'minecraft-ttf/out/'*.ttf -t "${pkgdir}/usr/share/fonts/minecraft"
}
