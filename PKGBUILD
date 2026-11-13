# Maintainer: t4t5 <t4t5@hey.com>
pkgname=rencal-bin
pkgver=0.9.3
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
sha256sums_x86_64=('5ccdc23d321dadaf8173ec0ff5f5834c08976fe023b3aaa7b443c0b244da441e')
sha256sums_aarch64=('6aef6328c3511b61dda4a135c02bea5df9064ab8e9208d52a97e002ba67c917c')

package() {
    cd "$srcdir"
    bsdtar -xf "rencal-$pkgver.deb"
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
