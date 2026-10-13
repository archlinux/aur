# Maintainer: t4t5 <t4t5@hey.com>
pkgname=rencal-bin
pkgver=0.8.1
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
sha256sums_x86_64=('a6906f50140d3c3e154b0e2a42686a1cdb08eae5477ed119443b68a9476db3c0')
sha256sums_aarch64=('c160d60e4f1ee24c1665057adbbfd25a1ba8fcb027c89b0d0e982ec2178dd002')

package() {
    cd "$srcdir"
    bsdtar -xf "rencal-$pkgver.deb"
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
