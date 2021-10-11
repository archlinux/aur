pkgname='chad-launcher-bin'
_pkgname="${pkgname%-bin}"
pkgver=0.4.3
pkgrel=1
pkgdesc='GNU/LINUX GAMING UNLEASHED!'
arch=('x86_64')
url='https://gitlab.com/Gnurur/chad_launcher'
license=('GPL3')
replaces=('chad_launcher-bin')
depends=(webkit2gtk curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 libvips)
makedepends=()
source=(
    "$_pkgname::https://notabug.org/attachments/deab4230-5a45-4a15-931f-339f6bb97048"
    "${_pkgname}.desktop::https://notabug.org/johncena141/chad_launcher/raw/v0.4.2/chad_launcher.desktop"
    "${_pkgname}.svg::https://notabug.org/johncena141/chad_launcher/raw/v0.4.2/icon.svg"
)
md5sums=('1d0e9c0be355906c78bb3278193b798f'
         '3982c2923488557d1bc82d8fc3391b4c'
         'eb5ae7c983884713edf7954c270085a2')

package() {
    cd $srcdir
    install -Dm0755 -t "$pkgdir/usr/bin/" "chad-launcher"
    install -Dm644 chad-launcher.desktop "$pkgdir/usr/share/applications/chad-launcher.desktop"
    install -Dm644 chad-launcher.svg "$pkgdir/usr/share/pixmaps/chad-launcher.svg"
}

