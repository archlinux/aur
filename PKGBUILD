# Maintainer: t4t5 <t4t5@hey.com>
pkgname=rencal-bin
pkgver=0.9.2
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
sha256sums_x86_64=('fa53c67bb442290ac3319291326c308a540bef8a16979fd2f683e4e29c31e3bd')
sha256sums_aarch64=('4c955f32a2b77a754095825ea6577bc1a001b94636779fb6ef985b7d53fdee75')

package() {
    cd "$srcdir"
    bsdtar -xf "rencal-$pkgver.deb"
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
