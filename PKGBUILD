pkgname='chad-launcher-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.4.4
pkgrel=1
pkgdesc='GNU/LINUX GAMING UNLEASHED!'
arch=('x86_64')
url='https://gitlab.com/Gnurur/chad_launcher'
license=('GPL3')
replaces=('chad_launcher-bin')
depends=(webkit2gtk curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 libvips)
makedepends=()
source=(
    "$_pkgname::https://notabug.org/attachments/ad7f3cc9-c219-47f1-a482-cbc1a1359fbb"
    "${_pkgname}.desktop::https://notabug.org/johncena141/${_pkgname}/raw/v${pkgver}/${_pkgname}.desktop"
    "${_pkgname}.svg::https://notabug.org/johncena141/${_pkgname}/raw/v${pkgver}/icon.svg"
)
md5sums=('98ad2ed5789fb69fae95626838c242d7'
         '3982c2923488557d1bc82d8fc3391b4c'
         'eb5ae7c983884713edf7954c270085a2')

package() {
    cd $srcdir
    install -Dm0755 -t "$pkgdir/usr/bin/" "${_pkgname}"
    install -Dm644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 ${_pkgname}.svg "$pkgdir/usr/share/pixmaps/${_pkgname}.svg"
}

