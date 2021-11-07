pkgname='chad-launcher-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.4.5
pkgrel=1
pkgdesc='Game library management'
arch=('x86_64')
url='https://notabug.org/johncena141/chad-launcher'
license=('GPL3')
provides=('chad-launcher')
replaces=('chad_launcher-bin')
depends=(webkit2gtk curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 libvips)
makedepends=()
source=(
    "$_pkgname::https://notabug.org/attachments/d1b074cc-8aea-4a6c-a502-a7a2ec1a479c"
    "${_pkgname}.desktop::https://notabug.org/johncena141/${_pkgname}/raw/v${pkgver}/${_pkgname}.desktop"
    "${_pkgname}.svg::https://notabug.org/johncena141/${_pkgname}/raw/v${pkgver}/icon.svg"
)
md5sums=('94b136ea492424ae74629669efaeb9de'
         '3982c2923488557d1bc82d8fc3391b4c'
         'eb5ae7c983884713edf7954c270085a2')

package() {
    cd $srcdir
    install -Dm0755 -t "$pkgdir/usr/bin/" "${_pkgname}"
    install -Dm644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 ${_pkgname}.svg "$pkgdir/usr/share/pixmaps/${_pkgname}.svg"
}

