# Maintainer: Djalel Oukid <sniper1720@linuxtechmore.com>
pkgname=khushu-bin
pkgver=1.2.0
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
sha256sums_x86_64=('e6e22c2b683152cca484d3f3c3387e8287c944ffd6271fcd9e50e2e6e83690d0')
sha256sums_aarch64=('32051fefc1d0a59136264f49809806ecced24276a37f2b020079389dffa2e4aa')

package() {
    cd "$srcdir"
    bsdtar xf "khushu_${pkgver}"_*.deb
    bsdtar xf data.tar.* -C "$pkgdir"
}
