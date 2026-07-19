# Maintainer: secext2022 <secext2022 at outlook dot com>
pkgname=librush-bin
pkgver=0.2.3
pkgrel=1
# https://github.com/fm-elpac/pmim-ibus
pkgdesc="ibus module for pmim (a Chinese pinyin input method)"
arch=('x86_64')
url="https://github.com/fm-elpac/librush"
license=('LGPL-2.1-or-later OR GPL-3.0-or-later')
depends=('ibus>=1.5.34')
conflicts=('librush')
optdepends=('flatpak: install pmim from flathub')
source=('librush-0.2.3.tar.gz::https://github.com/fm-elpac/librush/archive/refs/tags/v0.2.3.tar.gz'
        'librush_release_x86_64-unknown-linux-gnu.tar.zst::https://github.com/fm-elpac/librush/releases/download/v0.2.2/librush_release_x86_64-unknown-linux-gnu.tar.zst')
sha256sums=('7583f65abcae4b115b0482bce6a00f0e2b6521024de0231923516168bd538d14'
            '2b2c8bf20808647e87d88f40f11d66d829fdc3baa2e3ec1f3911d88281e68c54')

build() {
  cd "${srcdir}"
}

package() {
  cd "${srcdir}/librush-0.2.3"

  install -Dm755 -t "${pkgdir}/usr/lib/pmim" "${srcdir}/target/release/ibrus"
  install -Dm644 -t "${pkgdir}/usr/share/ibus/component" aur/pmim_ibrus.xml
}
