# Maintainer: Djalel Oukid <sniper1720@linuxtechmore.com>
pkgname=khushu-bin
pkgver=1.2.2
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
sha256sums_x86_64=('5fcd8463eb0165efda23a51b55f4b9278e6bd20b213af11126508b89615bb599')
sha256sums_aarch64=('19c024c900585a1cc524b5a3b3c4f79e54575f364b66324662c123cc6266084c')

package() {
    cd "$srcdir"
    bsdtar xf "khushu_${pkgver}"_*.deb
    bsdtar xf data.tar.* -C "$pkgdir"
}
