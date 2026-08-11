# Maintainer: Djalel Oukid <sniper1720@linuxtechmore.com>
pkgname=khushu-bin
pkgver=1.3.2
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
sha256sums_x86_64=('43325d9764a4cc1c88e7ac9586a2d440813a95518eaeb40739f4a307aff78813')
sha256sums_aarch64=('ca8cee239eb773bd649739d3e737c3dc47ec0559d8969470503d8d04442387db')

package() {
    cd "$srcdir"
    bsdtar xf "khushu_${pkgver}"_*.deb
    bsdtar xf data.tar.* -C "$pkgdir"
}
