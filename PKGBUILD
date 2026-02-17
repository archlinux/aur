# Maintainer: secext2022 <secext2022 at outlook dot com>
pkgname=librush-bin
pkgver=0.2.2
pkgrel=1
# https://github.com/fm-elpac/pmim-ibus
pkgdesc="ibus module for pmim (a Chinese pinyin input method)"
arch=('x86_64')
url="https://github.com/fm-elpac/librush"
license=('LGPL-2.1-or-later OR GPL-3.0-or-later')
depends=('ibus>=1.5.33')
conflicts=('librush')
optdepends=('flatpak: install pmim from flathub')
source=('librush.tar.gz::https://crates.io/api/v1/crates/librush/0.2.2/download'
        'librush_release_x86_64-unknown-linux-gnu.tar.zst::https://github.com/fm-elpac/librush/releases/download/v0.2.2/librush_release_x86_64-unknown-linux-gnu.tar.zst')
sha256sums=('9524559a9867b98a36a14ee4e6e5f0f8842bb174edec9232d9313af049f71727'
            '8bc95f1b93303c0c7d41100222aef0bb26479a51a3c26435b72cc00a8dd87c72')

build() {
  cd "${srcdir}"
}

package() {
  cd "${srcdir}/librush-0.2.2"

  install -Dm755 -t "${pkgdir}/usr/lib/pmim" "${srcdir}/target/release/ibrus"
  install -Dm644 -t "${pkgdir}/usr/share/ibus/component" aur/pmim_ibrus.xml
}
