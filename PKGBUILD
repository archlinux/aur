# Maintainer: Djalel Oukid <sniper1720@linuxtechmore.com>
pkgname=khushu-bin
pkgver=1.3.1
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
sha256sums_x86_64=('8da4ed438685037931971d55ca9593107e51a315e8d2b29fccf6f32cdc833566')
sha256sums_aarch64=('99642d9a11523585d01097b12d60a036b2a7b54f345b4e85e34b700f06d788e2')

package() {
    cd "$srcdir"
    bsdtar xf "khushu_${pkgver}"_*.deb
    bsdtar xf data.tar.* -C "$pkgdir"
}
