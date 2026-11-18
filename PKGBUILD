# Maintainer: t4t5 <t4t5@hey.com>
pkgname=rencal-bin
pkgver=0.10.0
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
sha256sums_x86_64=('091786b41803c97fa508b5192d6f0db0cf76ddeb7c6a5035c4375a9ce6d397b5')
sha256sums_aarch64=('e1d30acaeeb7d33bb211703afde03ea2c45c2fc0a39e9c492fa9f10b9d3f59e6')

package() {
    cd "$srcdir"
    bsdtar -xf "rencal-$pkgver.deb"
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
