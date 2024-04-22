# Maintainer: secext2022 <secext2022 at outlook dot com>
pkgname=librush-bin
pkgver=0.1.0a3
pkgrel=1
# https://github.com/fm-elpac/pmim-ibus
pkgdesc="ibus module for pmim (a Chinese pinyin input method)"
arch=('x86_64')
url="https://github.com/fm-elpac/librush"
license=('LGPL-2.1-or-later OR GPL-3.0-or-later')
depends=('ibus>=1.5.29')
optdepends=('flatpak: install pmim from flathub')
source=('librush_release_x86_64-unknown-linux-gnu.tar.zst::https://github.com/fm-elpac/librush/releases/download/v0.1.0-a3/librush_release_x86_64-unknown-linux-gnu.tar.zst'
        'pmim_ibrus.xml')
sha256sums=('7a9575ceff6a858023c094149da28011d66135248e24286eec20396969bbf50b'
            '1ee458d6dc9ad97a4afe9939076675b43f236196eb3bd6e9a5a9e7e41ee1ded6')

build() {
  cd "$srcdir"
}

package() {
  cd "$srcdir"

  install -Dm755 -t "$pkgdir/usr/lib/pmim" target/release/ibrus
  install -Dm644 -t "$pkgdir/usr/share/ibus/component" pmim_ibrus.xml
}
