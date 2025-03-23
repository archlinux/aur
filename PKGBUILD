# Maintainer: secext2022 <secext2022 at outlook dot com>
pkgname=librush-bin
pkgver=0.2.1
pkgrel=1
# https://github.com/fm-elpac/pmim-ibus
pkgdesc="ibus module for pmim (a Chinese pinyin input method)"
arch=('x86_64')
url="https://github.com/fm-elpac/librush"
license=('LGPL-2.1-or-later OR GPL-3.0-or-later')
depends=('ibus>=1.5.31')
optdepends=('flatpak: install pmim from flathub')
source=('librush_release_x86_64-unknown-linux-gnu.tar.zst::https://github.com/fm-elpac/librush/releases/download/v0.2.1/librush_release_x86_64-unknown-linux-gnu.tar.zst'
        'pmim_ibrus.xml')
sha256sums=('1d6120fb6d8e1b7738afef6cf54012c467e97768936d3b3b758ed341a7d99bfa'
            'e06cd54de1ceb828f9fe90ddddb0ae8df81b6b6540f86c6d9995918fd061f46c')

build() {
  cd "$srcdir"
}

package() {
  cd "$srcdir"

  install -Dm755 -t "$pkgdir/usr/lib/pmim" target/release/ibrus
  install -Dm644 -t "$pkgdir/usr/share/ibus/component" pmim_ibrus.xml
}
