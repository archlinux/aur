# Maintainer: t4t5 <t4t5@hey.com>
pkgname=rencal-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A calendar for Omarchy"
arch=('x86_64' 'aarch64')
url="https://github.com/t4t5/rencal"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'libnotify')
provides=('rencal')
conflicts=('rencal')
options=('!debug' '!strip')
source_x86_64=("rencal-$pkgver.deb::https://github.com/t4t5/rencal/releases/download/v$pkgver/renCal_${pkgver}_amd64.deb")
source_aarch64=("rencal-$pkgver.deb::https://github.com/t4t5/rencal/releases/download/v$pkgver/renCal_${pkgver}_arm64.deb")
sha256sums_x86_64=('32263319c2edfaf3cc0b52d8a72982ab2c9437c575ac8ce8380aac361fdae2eb')
sha256sums_aarch64=('a5368626e275e52ad79a68a64cbf58f66a746fbd2259bb5aa7a8e695f065db21')

package() {
    cd "$srcdir"
    bsdtar -xf "rencal-$pkgver.deb"
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
