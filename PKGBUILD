pkgname='chad-launcher-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.5.0
pkgrel=2
pkgdesc='Game library management'
arch=('x86_64')
url='https://notabug.org/johncena141/chad-launcher'
license=('GPL3')
provides=('chad-launcher')
replaces=('chad_launcher-bin')
depends=(webkit2gtk curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 libvips udev)
makedepends=()
source=(
    "$_pkgname::https://notabug.org/attachments/03faba78-026b-4641-997c-f036942bac60"
    "${_pkgname}.desktop::https://notabug.org/johncena141/${_pkgname}/raw/v${pkgver}/${_pkgname}.desktop"
    "${_pkgname}.svg::https://notabug.org/johncena141/${_pkgname}/raw/v${pkgver}/icon.svg"
)
md5sums=('d66ff5e11d378212b827e2ad83c7d30c'
         '3982c2923488557d1bc82d8fc3391b4c'
         'eb5ae7c983884713edf7954c270085a2')

package() {
    cd $srcdir
    install -Dm0755 -t "$pkgdir/usr/bin/" "${_pkgname}"
    install -Dm644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 ${_pkgname}.svg "$pkgdir/usr/share/pixmaps/${_pkgname}.svg"
}

