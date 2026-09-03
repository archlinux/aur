# Maintainer: Djalel Oukid <sniper1720@linuxtechmore.com>
pkgname=khushu-bin
pkgver=1.3.4
pkgrel=1
pkgdesc="An all-in-one Muslim app for Linux (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/sniper1720/khushu"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'glibc' 'gcc-libs' 'alsa-lib')
optdepends=('xdg-desktop-portal: autostart portal support')
options=(!debug)
provides=("khushu=$pkgver")
conflicts=('khushu')
source_x86_64=("khushu_${pkgver}_amd64.deb::https://github.com/sniper1720/khushu/releases/download/v${pkgver}/khushu_${pkgver}_amd64.deb")
source_aarch64=("khushu_${pkgver}_arm64.deb::https://github.com/sniper1720/khushu/releases/download/v${pkgver}/khushu_${pkgver}_arm64.deb")
sha256sums_x86_64=('60d65cd9f3055815e4b4c12aba6cd4306b83ceaed27f3b5001b1b63568172c9d')
sha256sums_aarch64=('80e37ee37e85bf5750221d6ee69deb70df3885e0981f35fbd6e3d453dd49c4e1')

package() {
    cd "$srcdir"
    bsdtar xf "khushu_${pkgver}"_*.deb
    bsdtar xf data.tar.* -C "$pkgdir"
}
