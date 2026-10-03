# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=f4-bin
_tag=v0.3.0-beta
pkgver=0.3.0beta
pkgrel=1
pkgdesc='Dual-pane Far Manager / far2l-style file manager with TUI and GUI'
arch=('x86_64' 'aarch64')
url="https://github.com/unxed/f4"
license=('BSD-3-Clause' 'MIT')
depends=('glibc' 'hicolor-icon-theme')
provides=('f4')
conflicts=('f4')
options=('!strip')
_source_prefix="$url/releases/download/$_tag/f4-linux-"
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/unxed/f4/$_tag/LICENSE")
source_x86_64=("f4-$pkgver-amd64.tar.gz::${_source_prefix}amd64.tar.gz")
source_aarch64=("f4-$pkgver-arm64.tar.gz::${_source_prefix}arm64.tar.gz")
sha256sums=('979fd5dae809c05ba4e625f005ac0de850ece6742db698fb5b97172ef2e75d18')
sha256sums_x86_64=('babf2091601a1281fc46af3e1afa917fbbb8ce9e6b75227df31df69fe0de66dd')
sha256sums_aarch64=('22f43ab6e154109dadb35a1f33062a9f193357efebcab00e132b08c6622194bc')

package() {
    install -Dm755 f4 "$pkgdir/usr/bin/f4"
    install -Dm644 share/applications/f4.desktop "$pkgdir/usr/share/applications/f4.desktop"
    cp -r share/icons "$pkgdir/usr/share/"
    install -Dm644 f4.example.ini "$pkgdir/usr/share/doc/f4/f4.example.ini"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 licenses/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
