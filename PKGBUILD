pkgname='chad-launcher-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.5.2
pkgrel=1
pkgdesc='Game library management'
arch=('x86_64')
url='https://notabug.org/johncena141/chad-launcher'
license=('GPL3')
provides=('chad-launcher')
replaces=('chad_launcher-bin')
depends=(webkit2gtk curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 libvips udev)
makedepends=()
source=(
    "$_pkgname-$pkgver::https://notabug.org/attachments/82c72fa0-ab50-413f-98a4-8720ebc49bc2"
    "${_pkgname}.desktop::https://notabug.org/johncena141/${_pkgname}/raw/v${pkgver}/${_pkgname}.desktop"
    "${_pkgname}.svg::https://notabug.org/johncena141/${_pkgname}/raw/v${pkgver}/icon.svg"
)
md5sums=('4935cb4c53a656b0ff68a2500ab04c61'
         '3982c2923488557d1bc82d8fc3391b4c'
         'eb5ae7c983884713edf7954c270085a2')

package() {
    cd $srcdir
    install -Dm0755 -t "$pkgdir/usr/bin/" "${_pkgname%-$pkgver}"
    install -Dm644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 ${_pkgname}.svg "$pkgdir/usr/share/pixmaps/${_pkgname}.svg"
}

